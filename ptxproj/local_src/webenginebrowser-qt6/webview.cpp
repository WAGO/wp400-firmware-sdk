// Copyright (C) 2016 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

#include "browser.h"
#include "browserwindow.h"
#include "tabwidget.h"
#include "webpage.h"
#include "webpopupwindow.h"
#include "webview.h"
#include "msgtool.h"
#include "ui_certificateerrordialog.h"
#include "ui_passworddialog.h"
#include <QContextMenuEvent>
#include <QDebug>
#include <QMenu>
#include <QMessageBox>
#include <QAuthenticator>
#include <QTimer>
#include <QStyle>
#include <QFileInfo>
#include <QNetworkInterface>

#include "globals.h"

using namespace Qt::StringLiterals;

WebView::WebView(QWidget *parent)
    : QWebEngineView(parent)
{
    connect(this, &QWebEngineView::loadStarted, [this]() {
        m_loadProgress = 0;
        emit favIconChanged(favIcon());
    });
    connect(this, &QWebEngineView::loadProgress, [this](int progress) {
        m_loadProgress = progress;
    });
    connect(this, &QWebEngineView::loadFinished, [this](bool success) {
        m_loadProgress = success ? 100 : -1;
        emit favIconChanged(favIcon());

        if (m_loadProgress == 100)
        {
            reconnectPage.Hide();
            QTimer::singleShot(200, this, SLOT(onCheckError500InternalServerError()));
        }
        else
        {
          if ((g_webengine.bReconnect) && ( success == false ))
                QTimer::singleShot(2000, this, SLOT(onShowReconnectPage()));
        }

    });
    connect(this, &QWebEngineView::iconChanged, [this](const QIcon &) {
        emit favIconChanged(favIcon());
    });

    connect(this, &QWebEngineView::renderProcessTerminated,
            [this](QWebEnginePage::RenderProcessTerminationStatus termStatus, int statusCode) {
        QString status;
        switch (termStatus) {
        case QWebEnginePage::NormalTerminationStatus:
            status = tr("Render process normal exit");
            break;
        case QWebEnginePage::AbnormalTerminationStatus:
            status = tr("Render process abnormal exit");
            break;
        case QWebEnginePage::CrashedTerminationStatus:
            status = tr("Render process crashed");
            break;
        case QWebEnginePage::KilledTerminationStatus:
            status = tr("Render process killed");
            break;
        }
        QMessageBox::StandardButton btn = QMessageBox::question(window(), status,
                                                   tr("Render process exited with code: %1\n"
                                                      "Do you want to reload the page ?").arg(statusCode));
        if (btn == QMessageBox::Yes)
            QTimer::singleShot(0, this, &WebView::reload);
    });

    connect(&reconnectPage, SIGNAL(signalStartWbm(QString)), this, SLOT(onShowWbm(QString)));
    m_pTimerReconnect = new QTimer(this);
    if (m_pTimerReconnect)
    {
        m_pTimerReconnect->setInterval(1000);
        connect(m_pTimerReconnect, SIGNAL(timeout()), this, SLOT(onReconnect()));
    }
}

WebView::~WebView()
{
    if (m_pTimerReconnect)
    {
        delete m_pTimerReconnect;
        m_pTimerReconnect = NULL;
    }
}

inline QString questionForFeature(QWebEnginePage::Feature feature)
{
    switch (feature) {
    case QWebEnginePage::Geolocation:
        return QObject::tr("Allow %1 to access your location information?");
    case QWebEnginePage::MediaAudioCapture:
        return QObject::tr("Allow %1 to access your microphone?");
    case QWebEnginePage::MediaVideoCapture:
        return QObject::tr("Allow %1 to access your webcam?");
    case QWebEnginePage::MediaAudioVideoCapture:
        return QObject::tr("Allow %1 to access your microphone and webcam?");
    case QWebEnginePage::MouseLock:
        return QObject::tr("Allow %1 to lock your mouse cursor?");
    case QWebEnginePage::DesktopVideoCapture:
        return QObject::tr("Allow %1 to capture video of your desktop?");
    case QWebEnginePage::DesktopAudioVideoCapture:
        return QObject::tr("Allow %1 to capture audio and video of your desktop?");
    case QWebEnginePage::Notifications:
        return QObject::tr("Allow %1 to show notification on your desktop?");
    }
    return QString();
}

void WebView::setPage(WebPage *page)
{
    if (auto oldPage = qobject_cast<WebPage *>(QWebEngineView::page())) {
        disconnect(oldPage, &WebPage::createCertificateErrorDialog, this,
                   &WebView::handleCertificateError);
        disconnect(oldPage, &QWebEnginePage::authenticationRequired, this,
                   &WebView::handleAuthenticationRequired);
        disconnect(oldPage, &QWebEnginePage::featurePermissionRequested, this,
                   &WebView::handleFeaturePermissionRequested);
        disconnect(oldPage, &QWebEnginePage::proxyAuthenticationRequired, this,
                   &WebView::handleProxyAuthenticationRequired);
        disconnect(oldPage, &QWebEnginePage::registerProtocolHandlerRequested, this,
                   &WebView::handleRegisterProtocolHandlerRequested);
#if QT_VERSION >= QT_VERSION_CHECK(6, 4, 0)
        disconnect(oldPage, &QWebEnginePage::fileSystemAccessRequested, this,
                   &WebView::handleFileSystemAccessRequested);
#endif
    }
    createWebActionTrigger(page,QWebEnginePage::Forward);
    createWebActionTrigger(page,QWebEnginePage::Back);
    createWebActionTrigger(page,QWebEnginePage::Reload);
    createWebActionTrigger(page,QWebEnginePage::Stop);
    QWebEngineView::setPage(page);
    connect(page, &WebPage::createCertificateErrorDialog, this, &WebView::handleCertificateError);
    connect(page, &QWebEnginePage::authenticationRequired, this,
            &WebView::handleAuthenticationRequired);
    connect(page, &QWebEnginePage::featurePermissionRequested, this,
            &WebView::handleFeaturePermissionRequested);
    connect(page, &QWebEnginePage::proxyAuthenticationRequired, this,
            &WebView::handleProxyAuthenticationRequired);
    connect(page, &QWebEnginePage::registerProtocolHandlerRequested, this,
            &WebView::handleRegisterProtocolHandlerRequested);
#if QT_VERSION >= QT_VERSION_CHECK(6, 4, 0)
    connect(page, &QWebEnginePage::fileSystemAccessRequested, this,
            &WebView::handleFileSystemAccessRequested);
#endif
}

int WebView::loadProgress() const
{
    return m_loadProgress;
}

void WebView::createWebActionTrigger(QWebEnginePage *page, QWebEnginePage::WebAction webAction)
{
    QAction *action = page->action(webAction);
    connect(action, &QAction::changed, [this, action, webAction]{
        emit webActionEnabledChanged(webAction, action->isEnabled());
    });
}

bool WebView::isWebActionEnabled(QWebEnginePage::WebAction webAction) const
{
    return page()->action(webAction)->isEnabled();
}

QIcon WebView::favIcon() const
{
    QIcon favIcon = icon();
    if (!favIcon.isNull())
        return favIcon;

    if (m_loadProgress < 0) {
        static QIcon errorIcon(u":dialog-error.png"_s);
        return errorIcon;
    }
    if (m_loadProgress < 100) {
        static QIcon loadingIcon(u":view-refresh.png"_s);
        return loadingIcon;
    }

    static QIcon defaultIcon(u":text-html.png"_s);
    return defaultIcon;
}

QWebEngineView *WebView::createWindow(QWebEnginePage::WebWindowType type)
{
    BrowserWindow *mainWindow = qobject_cast<BrowserWindow*>(window());
    if (!mainWindow)
        return nullptr;

    switch (type) {
    case QWebEnginePage::WebBrowserTab: {
        return mainWindow->tabWidget()->createTab();
    }
    case QWebEnginePage::WebBrowserBackgroundTab: {
        return mainWindow->tabWidget()->createBackgroundTab();
    }
    case QWebEnginePage::WebBrowserWindow: {
        return mainWindow->browser()->createWindow()->currentTab();
    }
    case QWebEnginePage::WebDialog: {
        WebPopupWindow *popup = new WebPopupWindow(page()->profile());
        connect(popup->view(), &WebView::devToolsRequested, this, &WebView::devToolsRequested);
        return popup->view();
    }
    }
    return nullptr;
}

void WebView::contextMenuEvent(QContextMenuEvent *event)
{
    if (IsUsbMousePresent() != 0)
      return;

    QMenu *menu = createStandardContextMenu();
    const QList<QAction *> actions = menu->actions();
    auto inspectElement = std::find(actions.cbegin(), actions.cend(), page()->action(QWebEnginePage::InspectElement));
    if (inspectElement == actions.cend()) {
        auto viewSource = std::find(actions.cbegin(), actions.cend(), page()->action(QWebEnginePage::ViewSource));
        if (viewSource == actions.cend())
            menu->addSeparator();

        QAction *action = menu->addAction("Open inspector in new window");
        connect(action, &QAction::triggered, [this]() { emit devToolsRequested(page()); });
    } else {
        (*inspectElement)->setText(tr("Inspect element"));
    }
    menu->popup(event->globalPos());
}

void WebView::handleCertificateError(QWebEngineCertificateError error)
{
    QString sHost = error.url().host();
    int iNum = error.type();

    //WBM - local webserver using https self signed certificate ...
    if (IsLocalhost(error.url()))
    {
      //skip dialog accept
      error.acceptCertificate();
      return;
    }


    //check low_enabled Browsersecurity low
    if (g_sslInfo.browser_security_level == BROWSER_SEC_LOW)
    {
        foreach (const int &iValue, g_sslInfo.low_enabled)
        {
            if (iNum == iValue)
            {
                //skip dialog accept
                error.acceptCertificate();
                return;
            }
        }
    }

    for (int i=0; i  < g_sslInfo.confirmedHosts.size(); i++)
    {
        tSslHost h = g_sslInfo.confirmedHosts.at(i);
        if ((h.host == sHost) && (h.numbers.contains(iNum)))
        {
            //skip dialog already accepted before
            error.acceptCertificate();
            return;
        }
    }

    QDialog dialog(window());
    dialog.setModal(true);
    dialog.setWindowFlags(dialog.windowFlags() & ~Qt::WindowContextHelpButtonHint);

    Ui::CertificateErrorDialog certificateDialog;
    certificateDialog.setupUi(&dialog);
    certificateDialog.m_iconLabel->setText(QString());
    QIcon icon(window()->style()->standardIcon(QStyle::SP_MessageBoxWarning, 0, window()));
    certificateDialog.m_iconLabel->setPixmap(icon.pixmap(32, 32));
    certificateDialog.m_errorLabel->setText(error.description());
    dialog.setWindowTitle(tr("Certificate Error"));

    if (dialog.exec() == QDialog::Accepted)
    {
        setSslErrorConfirmed(sHost, iNum);
        WriteSslAllowedToFile(sHost, iNum);
        error.acceptCertificate();
    }
    else
    {
        error.rejectCertificate();
    }
}

void WebView::handleAuthenticationRequired(const QUrl &requestUrl, QAuthenticator *auth)
{
    QDialog dialog(window());
    dialog.setModal(true);
    dialog.setWindowFlags(dialog.windowFlags() & ~Qt::WindowContextHelpButtonHint);

    Ui::PasswordDialog passwordDialog;
    passwordDialog.setupUi(&dialog);

    passwordDialog.m_iconLabel->setText(QString());
    QIcon icon(window()->style()->standardIcon(QStyle::SP_MessageBoxQuestion, 0, window()));
    passwordDialog.m_iconLabel->setPixmap(icon.pixmap(32, 32));

    QString introMessage(tr("Enter username and password for \"%1\" at %2")
                                 .arg(auth->realm(),
                                      requestUrl.toString().toHtmlEscaped()));
    passwordDialog.m_infoLabel->setText(introMessage);
    passwordDialog.m_infoLabel->setWordWrap(true);

    if (dialog.exec() == QDialog::Accepted) {
        auth->setUser(passwordDialog.m_userNameLineEdit->text());
        auth->setPassword(passwordDialog.m_passwordLineEdit->text());
    } else {
        // Set authenticator null if dialog is cancelled
        *auth = QAuthenticator();
    }
}

void WebView::handleFeaturePermissionRequested(const QUrl &securityOrigin,
                                               QWebEnginePage::Feature feature)
{
    QString title = tr("Permission Request");
    QString question = questionForFeature(feature).arg(securityOrigin.host());
    if (!question.isEmpty() && QMessageBox::question(window(), title, question) == QMessageBox::Yes)
        page()->setFeaturePermission(securityOrigin, feature,
                                     QWebEnginePage::PermissionGrantedByUser);
    else
        page()->setFeaturePermission(securityOrigin, feature,
                                     QWebEnginePage::PermissionDeniedByUser);
}

void WebView::handleProxyAuthenticationRequired(const QUrl &, QAuthenticator *auth,
                                                const QString &proxyHost)
{
    QDialog dialog(window());
    dialog.setModal(true);
    dialog.setWindowFlags(dialog.windowFlags() & ~Qt::WindowContextHelpButtonHint);

    Ui::PasswordDialog passwordDialog;
    passwordDialog.setupUi(&dialog);

    passwordDialog.m_iconLabel->setText(QString());
    QIcon icon(window()->style()->standardIcon(QStyle::SP_MessageBoxQuestion, 0, window()));
    passwordDialog.m_iconLabel->setPixmap(icon.pixmap(32, 32));

    QString introMessage = tr("Connect to proxy \"%1\" using:");
    introMessage = introMessage.arg(proxyHost.toHtmlEscaped());
    passwordDialog.m_infoLabel->setText(introMessage);
    passwordDialog.m_infoLabel->setWordWrap(true);

    if (dialog.exec() == QDialog::Accepted) {
        auth->setUser(passwordDialog.m_userNameLineEdit->text());
        auth->setPassword(passwordDialog.m_passwordLineEdit->text());
    } else {
        // Set authenticator null if dialog is cancelled
        *auth = QAuthenticator();
    }
}

//! [registerProtocolHandlerRequested]
void WebView::handleRegisterProtocolHandlerRequested(
        QWebEngineRegisterProtocolHandlerRequest request)
{
    auto answer = QMessageBox::question(window(), tr("Permission Request"),
                                        tr("Allow %1 to open all %2 links?")
                                                .arg(request.origin().host())
                                                .arg(request.scheme()));
    if (answer == QMessageBox::Yes)
        request.accept();
    else
        request.reject();
}
//! [registerProtocolHandlerRequested]

#if QT_VERSION >= QT_VERSION_CHECK(6, 4, 0)
void WebView::handleFileSystemAccessRequested(QWebEngineFileSystemAccessRequest request)
{
    QString accessType;
    switch (request.accessFlags()) {
    case QWebEngineFileSystemAccessRequest::Read:
        accessType = "read";
        break;
    case QWebEngineFileSystemAccessRequest::Write:
        accessType = "write";
        break;
    case QWebEngineFileSystemAccessRequest::Read | QWebEngineFileSystemAccessRequest::Write:
        accessType = "read and write";
        break;
    default:
        Q_UNREACHABLE();
    }

    auto answer = QMessageBox::question(window(), tr("File system access reques"),
                                        tr("Give %1 %2 access to %3?")
                                                .arg(request.origin().host())
                                                .arg(accessType)
                                                .arg(request.filePath().toString()));
    if (answer == QMessageBox::Yes)
        request.accept();
    else
        request.reject();
}
#endif // QT_VERSION >= QT_VERSION_CHECK(6, 4, 0)


void WebView::onReconnect()
{
    //qDebug() << "onReconnect";
    stop();
    reload();
}

void WebView::onShowReconnectPage()
{
    //qDebug() << "onShowReconnectPage";

    if (IsCurrentWebView() ==  false)
    {
        //do not show reconnect page
        return;
    }

    //only in visible BrowserTab
    if (m_pTimerReconnect)
    {
        m_pTimerReconnect->stop();
        m_pTimerReconnect->setSingleShot(true);
        m_pTimerReconnect->start(g_webengine.iReconnectInterval * 1000);

        //close virtual keyboard if neccessary
        //char * pCmd = "close\n";
        //Write2PipedFifo(DEV_VIRTUALKEYBOARD, pCmd);

        //only show reconnect screen in active tab
        reconnectPage.Countdown(g_webengine.iReconnectInterval);
        reconnectPage.Show();
        QString s = g_webengine.sDisconnectedText;
        reconnectPage.SetLabelText(s.replace("%U", url().toString()));
    }
}

void WebView::onCheckError500InternalServerError()
{
    //500 - Internal Server Error
    page()->toPlainText([this](QString sPlain)
    {
        //qDebug() << "onCheckError500InternalServerError " << sPlain.length();
        if (sPlain.length() < 256)
        {
            for (int i=0; i < g_webengine.slError5Text.count(); i++)
            {
                if (sPlain.contains(g_webengine.slError5Text.at(i), Qt::CaseInsensitive) == true)
                {
                    //qDebug() << sPlain;
                    QTimer::singleShot(200, this, SLOT(onShowReconnectPage()));
                    break;
                }
            }
        }
    });
}

void WebView::onShowWbm(QString sWbm)
{
    if (m_pTimerReconnect)
        m_pTimerReconnect->stop();

    stop();

    QObject * pParentObj = parentWidget()->parent();
    TabWidget * pTabWidget = qobject_cast<TabWidget*>(pParentObj);
    if (pTabWidget)
        pTabWidget->setUrl(QUrl::fromUserInput(sWbm));
}

bool WebView::IsCurrentWebView()
{
    bool bRet = false;
    try
    {
        QObject * pParentObj = parentWidget()->parent();
        TabWidget * pTabs = qobject_cast<TabWidget*>(pParentObj);
        if (pTabs)
        {
            int iCurrentIndex = pTabs->currentIndex();
            if (iCurrentIndex >= 0)
            {
                if (pTabs->isTabVisible(iCurrentIndex) == true)
                {
                    bRet = true;
                }
            }
        }
    }
    catch(...)
    {
        qDebug() << "Exception in IsCurrentWebView";
    }
    return bRet;
}

bool WebView::setSslErrorConfirmed(QString host, int nErr)
{
    bool bRet = false;
    //QList<int> list;

    tSslHost h;
    h.host = host;
    h.numbers.append(nErr);

    //qDebug() << "setSslErrorConfirmed" << host << " " << nErr;

    if (g_sslInfo.confirmedHosts.contains(host) == false)
    {
        g_sslInfo.confirmedHosts.append(h);
        bRet = true;
    }
    else
    {
        int index = g_sslInfo.confirmedHosts.indexOf(host);
        if (index >= 0)
        {
            if (g_sslInfo.confirmedHosts.at(index).numbers.contains(nErr) == false)
            {
                ((tSslHost *) &g_sslInfo.confirmedHosts.at(index))->numbers.append(nErr);
                bRet = true;
            }
        }
    }

    return bRet;
}

int WebView::WriteSslAllowedToFile(QString host, int nErr)
{
    int retval = -1;
    QFileInfo fi(CONF_FILE_SSLALLOWED);
    QFile inputFile(CONF_FILE_SSLALLOWED);
    if (fi.isFile() && fi.exists())
    {
        //file exists, read complete file content into string list
        QStringList slFile;
        if (inputFile.open(QIODevice::ReadOnly))
        {
            QTextStream in(&inputFile);
            while (!in.atEnd())
            {
                QString s = in.readLine();
                slFile.append(s);
            }
            inputFile.close();
        }

        bool bFound = false;
        int i=0;
        foreach (const QString &sLine, slFile)
        {
            QStringList sl = sLine.split("=");
            if (sl.size() == 2)
            {
                QString sHost = sl.at(0);
                QString sSslCodes = sl.at(1);
                sHost = sHost.trimmed();
                sSslCodes = sSslCodes.trimmed();

                if (sHost.compare(host, Qt::CaseInsensitive) == 0)
                {
                    QStringList slCodes = sSslCodes.split(",");
                    bFound = true;
                    if (slCodes.contains(QString::number(nErr)) == false)
                    {
                        //append new ssl code
                        QString sNew = sLine + "," + QString::number(nErr);
                        slFile.replace(i, sNew);
                    }
                }
            }
            i++;
        }

        if (bFound == false)
        {
            //append new line
            QString sNewLine = host + "=" + QString::number(nErr);
            slFile.append(sNewLine);
        }

        //write complete file content into string list
        if (inputFile.open(QIODevice::WriteOnly | QIODevice::Truncate | QIODevice::Text))
        {
            QTextStream out(&inputFile);
            foreach (const QString &sLine, slFile)
            {
                out << sLine << Qt::endl;
            }
            out.flush();
            inputFile.close();
            retval = 0;
        }

    }
    else
    {
        //file not exists, create one
        if (inputFile.open(QIODevice::WriteOnly | QIODevice::Truncate | QIODevice::Text))
        {
            QTextStream out(&inputFile);
            QString s = host;
            s += "=";
            s += QString::number(nErr);

            out << s  << Qt::endl;
            out.flush();
            inputFile.close();
            retval = 0;
        }
    }

    return retval;
}

QString WebView::GetLocalIpAddress(QString sAdapter)
{
  QString sRet = "";
  try
  {
    QNetworkInterface iface = QNetworkInterface::interfaceFromName(sAdapter);
    if (iface.isValid() == true)
    {
      QList<QNetworkAddressEntry> entries = iface.addressEntries();
      if (!entries.isEmpty()) {
        QNetworkAddressEntry entry = entries.first();
        sRet = entry.ip().toString().trimmed();
      }
    }
  }
  catch(...)
  {
    qDebug() << "Exception in GetLocalIpAddress";
  }
  return sRet;
}

bool WebView::IsLocalhost()
{
  if ( (url().host().contains("localhost")) || (url().host().contains("127.0.0.")) )
  {
    return true;
  }
  else
  {
    QString br0 = GetLocalIpAddress("br0");
    if ((br0.length() > 2 ) && (url().host().contains(br0)))
      return true;

    QString br1 = GetLocalIpAddress("br1");
    if ((br1.length() > 2 ) && (url().host().contains(br1)))
      return true;

    return false;
  }
}

bool WebView::IsLocalhost(QUrl u)
{
  if ( (u.host().contains("localhost")) || (u.host().contains("127.0.0.")) )
  {
    return true;
  }
  else
  {
    QString br0 = GetLocalIpAddress("br0");
    if ((br0.length() > 2 ) && (u.host().contains(br0)))
      return true;

    QString br1 = GetLocalIpAddress("br1");
    if ((br1.length() > 2 ) && (u.host().contains(br1)))
      return true;

    return false;
  }
}


