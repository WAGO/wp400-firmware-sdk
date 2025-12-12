// Copyright (C) 2016 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

#include "browser.h"
#include "browserwindow.h"
#include "downloadmanagerwidget.h"
#include "tabwidget.h"
#include "webview.h"
#include "cmdthread.h"
#include "tools.h"
#include <QApplication>
#include <QCloseEvent>
#include <QEvent>
#include <QFileDialog>
#include <QInputDialog>
#include <QMenuBar>
#include <QMessageBox>
#include <QProgressBar>
#include <QScreen>
#include <QStatusBar>
#include <QToolBar>
#include <QVBoxLayout>
#include <QWebEngineFindTextResult>
#include <QWebEngineProfile>
#include <QtGlobal>
#include <QProcess>
#include <QDebug>



#include "globals.h"
#define MAX_TAB_COUNT           10

using namespace Qt::StringLiterals;

BrowserWindow::BrowserWindow(Browser *browser, QWebEngineProfile *profile, bool forDevTools)
    : m_browser(browser)
    , m_profile(profile)
    , m_tabWidget(new TabWidget(profile, this))
{
    setAttribute(Qt::WA_DeleteOnClose, true);
    setFocusPolicy(Qt::ClickFocus);
    pCmdThread = NULL;
    //this->setWindowState(Qt::WindowFullScreen);

    if (!forDevTools) {
        m_progressBar = new QProgressBar(this);
        m_progressBar->setStyleSheet("border: 0px solid red");

        QToolBar *toolbar = createToolBar();
        addToolBar(toolbar);
        menuBar()->addMenu(createFileMenu(m_tabWidget));
        menuBar()->addMenu(createEditMenu());
        menuBar()->addMenu(createViewMenu(toolbar));
        menuBar()->addMenu(createWindowMenu(m_tabWidget));
        menuBar()->addMenu(createHelpMenu());
    }

    QWidget *centralWidget = new QWidget(this);
    QVBoxLayout *layout = new QVBoxLayout;
    layout->setSpacing(0);
    layout->setContentsMargins(0, 0, 0, 0);
    if (!forDevTools) {
        addToolBarBreak();

        m_progressBar->setMaximumHeight(0);
        m_progressBar->setTextVisible(false);
        m_progressBar->setStyleSheet(u"QProgressBar {border: 0px} QProgressBar::chunk {background-color: #da4453}"_s);

        layout->addWidget(m_progressBar);
    }

    layout->addWidget(m_tabWidget);
    centralWidget->setLayout(layout);
    setCentralWidget(centralWidget);

    connect(m_tabWidget, &TabWidget::titleChanged, this, &BrowserWindow::handleWebViewTitleChanged);
    if (!forDevTools) {
        connect(m_tabWidget, &TabWidget::linkHovered, [this](const QString& url) {
            statusBar()->showMessage(url);
        });
        connect(m_tabWidget, &TabWidget::loadProgress, this, &BrowserWindow::handleWebViewLoadProgress);
        connect(m_tabWidget, &TabWidget::webActionEnabledChanged, this, &BrowserWindow::handleWebActionEnabledChanged);
        connect(m_tabWidget, &TabWidget::urlChanged, [this](const QUrl &url) {
            m_urlLineEdit->setText(url.toDisplayString());
        });
        connect(m_tabWidget, &TabWidget::favIconChanged, m_favAction, &QAction::setIcon);
        connect(m_tabWidget, &TabWidget::devToolsRequested, this, &BrowserWindow::handleDevToolsRequested);
        connect(m_urlLineEdit, &QLineEdit::returnPressed, [this]() {
            m_tabWidget->setUrl(QUrl::fromUserInput(m_urlLineEdit->text()));
        });
        connect(m_tabWidget, &TabWidget::findTextFinished, this, &BrowserWindow::handleFindTextFinished);

        QAction *focusUrlLineEditAction = new QAction(this);
        addAction(focusUrlLineEditAction);
        focusUrlLineEditAction->setShortcut(QKeySequence(Qt::CTRL | Qt::Key_L));
        connect(focusUrlLineEditAction, &QAction::triggered, this, [this] () {
            m_urlLineEdit->setFocus(Qt::ShortcutFocusReason);
        });
    }

    handleWebViewTitleChanged(QString());
    m_tabWidget->createTab();
    m_tabWidget->setMaximumHeight(QWIDGETSIZE_MAX);
    m_tabWidget->setMaximumWidth(QWIDGETSIZE_MAX);
    m_tabWidget->setTabBarAutoHide(true);

    //m_tabWidget->setStyleSheet("border: 1px solid red");
    //m_tabWidget->setStyleSheet("border: 0px");
    menuBar()->hide();
    statusBar()->hide();

    //centralWidget->setStyleSheet("border: 1px solid red");
    centralWidget->setWindowState(Qt::WindowFullScreen);
    //centralWidget->setWindowFlags(Qt::Window | Qt::FramelessWindowHint | Qt::CustomizeWindowHint);
    //centralWidget->setWindowFlags(Qt::Widget | Qt::FramelessWindowHint | Qt::CustomizeWindowHint);
    centralWidget->setWindowFlags(Qt::FramelessWindowHint | Qt::CustomizeWindowHint);
    ReadWebengineConfigurationFile(CONF_FILE_WEBENGINE);
    ReadBrowserSecurityLevel();
    ReadSslAllowedFromFile();

    startCmdThread();

    // create browser user agent string
    CreateUserAgentString();
    profile->setHttpUserAgent(m_sUserAgent);
    //qDebug() << profile->httpUserAgent();

}

QSize BrowserWindow::sizeHint() const
{
    QRect desktopRect = QApplication::primaryScreen()->geometry();
    QSize size = desktopRect.size() * qreal(0.9);
    return size;
}

QMenu *BrowserWindow::createFileMenu(TabWidget *tabWidget)
{
    QMenu *fileMenu = new QMenu(tr("&File"));
#if QT_VERSION >= QT_VERSION_CHECK(6, 3, 0)
    fileMenu->addAction(tr("&New Window"), QKeySequence::New, this, &BrowserWindow::handleNewWindowTriggered);
#else
    fileMenu->addAction(tr("&New Window"), this, &BrowserWindow::handleNewWindowTriggered, QKeySequence::New);
#endif
    fileMenu->addAction(tr("New &Incognito Window"), this, &BrowserWindow::handleNewIncognitoWindowTriggered);

    QAction *newTabAction = new QAction(tr("New &Tab"), this);
    newTabAction->setShortcuts(QKeySequence::AddTab);
    connect(newTabAction, &QAction::triggered, this, [this]() {
        m_tabWidget->createTab();
        m_urlLineEdit->setFocus();
    });
    fileMenu->addAction(newTabAction);

#if QT_VERSION >= QT_VERSION_CHECK(6, 3, 0)
    fileMenu->addAction(tr("&Open File..."), QKeySequence::Open, this, &BrowserWindow::handleFileOpenTriggered);
#else
    fileMenu->addAction(tr("&Open File..."), this, &BrowserWindow::handleFileOpenTriggered, QKeySequence::Open);
#endif
    fileMenu->addSeparator();

    QAction *closeTabAction = new QAction(tr("&Close Tab"), this);
    closeTabAction->setShortcuts(QKeySequence::Close);
    connect(closeTabAction, &QAction::triggered, [tabWidget]() {
        tabWidget->closeTab(tabWidget->currentIndex());
    });
    fileMenu->addAction(closeTabAction);

    QAction *closeAction = new QAction(tr("&Quit"),this);
    closeAction->setShortcut(QKeySequence(Qt::CTRL | Qt::Key_Q));
    connect(closeAction, &QAction::triggered, this, &QWidget::close);
    fileMenu->addAction(closeAction);

    connect(fileMenu, &QMenu::aboutToShow, [this, closeAction]() {
        if (m_browser->windows().count() == 1)
            closeAction->setText(tr("&Quit"));
        else
            closeAction->setText(tr("&Close Window"));
    });
    return fileMenu;
}

QMenu *BrowserWindow::createEditMenu()
{
    QMenu *editMenu = new QMenu(tr("&Edit"));
    QAction *findAction = editMenu->addAction(tr("&Find"));
    findAction->setShortcuts(QKeySequence::Find);
    connect(findAction, &QAction::triggered, this, &BrowserWindow::handleFindActionTriggered);

    QAction *findNextAction = editMenu->addAction(tr("Find &Next"));
    findNextAction->setShortcut(QKeySequence::FindNext);
    connect(findNextAction, &QAction::triggered, [this]() {
        if (!currentTab() || m_lastSearch.isEmpty())
            return;
        currentTab()->findText(m_lastSearch);
    });

    QAction *findPreviousAction = editMenu->addAction(tr("Find &Previous"));
    findPreviousAction->setShortcut(QKeySequence::FindPrevious);
    connect(findPreviousAction, &QAction::triggered, [this]() {
        if (!currentTab() || m_lastSearch.isEmpty())
            return;
        currentTab()->findText(m_lastSearch, QWebEnginePage::FindBackward);
    });

    return editMenu;
}

QMenu *BrowserWindow::createViewMenu(QToolBar *toolbar)
{
    QMenu *viewMenu = new QMenu(tr("&View"));
    m_stopAction = viewMenu->addAction(tr("&Stop"));
    QList<QKeySequence> shortcuts;
    shortcuts.append(QKeySequence(Qt::CTRL | Qt::Key_Period));
    shortcuts.append(Qt::Key_Escape);
    m_stopAction->setShortcuts(shortcuts);
    connect(m_stopAction, &QAction::triggered, [this]() {
        m_tabWidget->triggerWebPageAction(QWebEnginePage::Stop);
    });

    m_reloadAction = viewMenu->addAction(tr("Reload Page"));
    m_reloadAction->setShortcuts(QKeySequence::Refresh);
    connect(m_reloadAction, &QAction::triggered, [this]() {
        m_tabWidget->triggerWebPageAction(QWebEnginePage::Reload);
    });

    QAction *zoomIn = viewMenu->addAction(tr("Zoom &In"));
    zoomIn->setShortcut(QKeySequence(Qt::CTRL | Qt::Key_Plus));
    connect(zoomIn, &QAction::triggered, [this]() {
        if (currentTab())
            currentTab()->setZoomFactor(currentTab()->zoomFactor() + 0.1);
    });

    QAction *zoomOut = viewMenu->addAction(tr("Zoom &Out"));
    zoomOut->setShortcut(QKeySequence(Qt::CTRL | Qt::Key_Minus));
    connect(zoomOut, &QAction::triggered, [this]() {
        if (currentTab())
            currentTab()->setZoomFactor(currentTab()->zoomFactor() - 0.1);
    });

    QAction *resetZoom = viewMenu->addAction(tr("Reset &Zoom"));
    resetZoom->setShortcut(QKeySequence(Qt::CTRL | Qt::Key_0));
    connect(resetZoom, &QAction::triggered, [this]() {
        if (currentTab())
            currentTab()->setZoomFactor(1.0);
    });


    viewMenu->addSeparator();
    QAction *viewToolbarAction = new QAction(tr("Hide Toolbar"),this);
    viewToolbarAction->setShortcut(tr("Ctrl+|"));
    connect(viewToolbarAction, &QAction::triggered, [toolbar,viewToolbarAction]() {
        if (toolbar->isVisible()) {
            viewToolbarAction->setText(tr("Show Toolbar"));
            toolbar->close();
        } else {
            viewToolbarAction->setText(tr("Hide Toolbar"));
            toolbar->show();
        }
    });
    viewMenu->addAction(viewToolbarAction);

    QAction *viewStatusbarAction = new QAction(tr("Hide Status Bar"), this);
    viewStatusbarAction->setShortcut(tr("Ctrl+/"));
    connect(viewStatusbarAction, &QAction::triggered, [this, viewStatusbarAction]() {
        if (statusBar()->isVisible()) {
            viewStatusbarAction->setText(tr("Show Status Bar"));
            statusBar()->close();
        } else {
            viewStatusbarAction->setText(tr("Hide Status Bar"));
            //statusBar()->show();
        }
    });
    viewMenu->addAction(viewStatusbarAction);
    return viewMenu;
}

QMenu *BrowserWindow::createWindowMenu(TabWidget *tabWidget)
{
    QMenu *menu = new QMenu(tr("&Window"));

    QAction *nextTabAction = new QAction(tr("Show Next Tab"), this);
    QList<QKeySequence> shortcuts;
    shortcuts.append(QKeySequence(Qt::CTRL | Qt::Key_BraceRight));
    shortcuts.append(QKeySequence(Qt::CTRL | Qt::Key_PageDown));
    shortcuts.append(QKeySequence(Qt::CTRL | Qt::Key_BracketRight));
    shortcuts.append(QKeySequence(Qt::CTRL | Qt::Key_Less));
    nextTabAction->setShortcuts(shortcuts);
    connect(nextTabAction, &QAction::triggered, tabWidget, &TabWidget::nextTab);

    QAction *previousTabAction = new QAction(tr("Show Previous Tab"), this);
    shortcuts.clear();
    shortcuts.append(QKeySequence(Qt::CTRL | Qt::Key_BraceLeft));
    shortcuts.append(QKeySequence(Qt::CTRL | Qt::Key_PageUp));
    shortcuts.append(QKeySequence(Qt::CTRL | Qt::Key_BracketLeft));
    shortcuts.append(QKeySequence(Qt::CTRL | Qt::Key_Greater));
    previousTabAction->setShortcuts(shortcuts);
    connect(previousTabAction, &QAction::triggered, tabWidget, &TabWidget::previousTab);

    QAction *inspectorAction = new QAction(tr("Open inspector in new window"), this);
    shortcuts.clear();
    shortcuts.append(QKeySequence(Qt::CTRL | Qt::SHIFT | Qt::Key_I));
    inspectorAction->setShortcuts(shortcuts);
    connect(inspectorAction, &QAction::triggered, [this]() { emit currentTab()->devToolsRequested(currentTab()->page()); });

    connect(menu, &QMenu::aboutToShow, [this, menu, nextTabAction, previousTabAction, inspectorAction]() {
        menu->clear();
        menu->addAction(nextTabAction);
        menu->addAction(previousTabAction);
        menu->addSeparator();
        menu->addAction(inspectorAction);
        menu->addSeparator();

        QList<BrowserWindow*> windows = m_browser->windows();
        int index(-1);
        for (auto window : windows) {
            QAction *action = menu->addAction(window->windowTitle(), this, &BrowserWindow::handleShowWindowTriggered);
            action->setData(++index);
            action->setCheckable(true);
            if (window == this)
                action->setChecked(true);
        }
    });
    return menu;
}

QMenu *BrowserWindow::createHelpMenu()
{
    QMenu *helpMenu = new QMenu(tr("&Help"));
    helpMenu->addAction(tr("About &Qt"), qApp, QApplication::aboutQt);
    return helpMenu;
}

static bool isBackspace(const QKeySequence &k)
{
    return (k[0].key() & Qt::Key_unknown) == Qt::Key_Backspace;
}

// Chromium already handles navigate on backspace when appropriate.
static QList<QKeySequence> removeBackspace(QList<QKeySequence> keys)
{
    const auto it = std::find_if(keys.begin(), keys.end(), isBackspace);
    if (it != keys.end())
        keys.erase(it);
    return keys;
}

QToolBar *BrowserWindow::createToolBar()
{
    QToolBar *navigationBar = new QToolBar(tr("Navigation"));
    navigationBar->setMovable(false);
    navigationBar->toggleViewAction()->setEnabled(false);

    m_historyBackAction = new QAction(this);
    auto backShortcuts = removeBackspace(QKeySequence::keyBindings(QKeySequence::Back));
    // For some reason Qt doesn't bind the dedicated Back key to Back.
    backShortcuts.append(QKeySequence(Qt::Key_Back));
    m_historyBackAction->setShortcuts(backShortcuts);
    m_historyBackAction->setIconVisibleInMenu(false);
    m_historyBackAction->setIcon(QIcon(u":go-previous.png"_s));
    m_historyBackAction->setToolTip(tr("Go back in history"));
    connect(m_historyBackAction, &QAction::triggered, [this]() {
        m_tabWidget->triggerWebPageAction(QWebEnginePage::Back);
    });
    navigationBar->addAction(m_historyBackAction);

    m_historyForwardAction = new QAction(this);
    auto fwdShortcuts = removeBackspace(QKeySequence::keyBindings(QKeySequence::Forward));
    fwdShortcuts.append(QKeySequence(Qt::Key_Forward));
    m_historyForwardAction->setShortcuts(fwdShortcuts);
    m_historyForwardAction->setIconVisibleInMenu(false);
    m_historyForwardAction->setIcon(QIcon(u":go-next.png"_s));
    m_historyForwardAction->setToolTip(tr("Go forward in history"));
    connect(m_historyForwardAction, &QAction::triggered, [this]() {
        m_tabWidget->triggerWebPageAction(QWebEnginePage::Forward);
    });
    navigationBar->addAction(m_historyForwardAction);

    m_stopReloadAction = new QAction(this);
    connect(m_stopReloadAction, &QAction::triggered, [this]() {
        m_tabWidget->triggerWebPageAction(QWebEnginePage::WebAction(m_stopReloadAction->data().toInt()));
    });
    navigationBar->addAction(m_stopReloadAction);

    m_urlLineEdit = new QLineEdit(this);
    m_favAction = new QAction(this);
    m_urlLineEdit->addAction(m_favAction, QLineEdit::LeadingPosition);
    m_urlLineEdit->setClearButtonEnabled(true);
    navigationBar->addWidget(m_urlLineEdit);

    auto downloadsAction = new QAction(this);
    downloadsAction->setIcon(QIcon(u":go-bottom.png"_s));
    downloadsAction->setToolTip(tr("Show downloads"));
    navigationBar->addAction(downloadsAction);
    connect(downloadsAction, &QAction::triggered,
            &m_browser->downloadManagerWidget(), &QWidget::show);

	navigationBar->hide();

    return navigationBar;
}

void BrowserWindow::handleWebActionEnabledChanged(QWebEnginePage::WebAction action, bool enabled)
{
    switch (action) {
    case QWebEnginePage::Back:
        m_historyBackAction->setEnabled(enabled);
        break;
    case QWebEnginePage::Forward:
        m_historyForwardAction->setEnabled(enabled);
        break;
    case QWebEnginePage::Reload:
        m_reloadAction->setEnabled(enabled);
        break;
    case QWebEnginePage::Stop:
        m_stopAction->setEnabled(enabled);
        break;
    default:
        qWarning("Unhandled webActionChanged signal");
    }
}

void BrowserWindow::handleWebViewTitleChanged(const QString &title)
{
    QString suffix = m_profile->isOffTheRecord()
        ? tr("Qt Simple Browser (Incognito)")
        : tr("Qt Simple Browser");

    if (title.isEmpty())
        setWindowTitle(suffix);
    else
        setWindowTitle(title + " - " + suffix);
}

void BrowserWindow::handleNewWindowTriggered()
{
    BrowserWindow *window = m_browser->createWindow();
    window->m_urlLineEdit->setFocus();
}

void BrowserWindow::handleNewIncognitoWindowTriggered()
{
    BrowserWindow *window = m_browser->createWindow(/* offTheRecord: */ true);
    window->m_urlLineEdit->setFocus();
}

void BrowserWindow::handleFileOpenTriggered()
{
    QUrl url = QFileDialog::getOpenFileUrl(this, tr("Open Web Resource"), QString(),
                                                tr("Web Resources (*.html *.htm *.svg *.png *.gif *.svgz);;All files (*.*)"));
    if (url.isEmpty())
        return;
    currentTab()->setUrl(url);
}

void BrowserWindow::handleFindActionTriggered()
{
    if (!currentTab())
        return;
    bool ok = false;
    QString search = QInputDialog::getText(this, tr("Find"),
                                           tr("Find:"), QLineEdit::Normal,
                                           m_lastSearch, &ok);
    if (ok && !search.isEmpty()) {
        m_lastSearch = search;
        currentTab()->findText(m_lastSearch);
    }
}

void BrowserWindow::closeEvent(QCloseEvent *event)
{
    if (m_tabWidget->count() > 1) {
        int ret = QMessageBox::warning(this, tr("Confirm close"),
                                       tr("Are you sure you want to close the window ?\n"
                                          "There are %1 tabs open.").arg(m_tabWidget->count()),
                                       QMessageBox::Yes | QMessageBox::No, QMessageBox::No);
        if (ret == QMessageBox::No) {
            event->ignore();
            return;
        }
    }

    if (pCmdThread)
    pCmdThread->terminate();

    event->accept();
    deleteLater();

    if (pCmdThread)
    pCmdThread->wait(500);
}

TabWidget *BrowserWindow::tabWidget() const
{
    return m_tabWidget;
}

WebView *BrowserWindow::currentTab() const
{
    m_tabWidget->setWindowState(Qt::WindowFullScreen);
    return m_tabWidget->currentWebView();
}

void BrowserWindow::handleWebViewLoadProgress(int progress)
{
    static QIcon stopIcon(u":process-stop.png"_s);
    static QIcon reloadIcon(u":view-refresh.png"_s);

    if (0 < progress && progress < 100) {
        m_stopReloadAction->setData(QWebEnginePage::Stop);
        m_stopReloadAction->setIcon(stopIcon);
        m_stopReloadAction->setToolTip(tr("Stop loading the current page"));
        m_progressBar->setValue(progress);
    } else {
        m_stopReloadAction->setData(QWebEnginePage::Reload);
        m_stopReloadAction->setIcon(reloadIcon);
        m_stopReloadAction->setToolTip(tr("Reload the current page"));
        m_progressBar->setValue(0);
    }
}

void BrowserWindow::handleShowWindowTriggered()
{
    if (QAction *action = qobject_cast<QAction*>(sender())) {
        int offset = action->data().toInt();
        QList<BrowserWindow*> windows = m_browser->windows();
        windows.at(offset)->activateWindow();
        windows.at(offset)->currentTab()->setFocus();
    }
}

void BrowserWindow::handleDevToolsRequested(QWebEnginePage *source)
{
    source->setDevToolsPage(m_browser->createDevToolsWindow()->currentTab()->page());
    source->triggerAction(QWebEnginePage::InspectElement);
}

void BrowserWindow::handleFindTextFinished(const QWebEngineFindTextResult &result)
{
    if (result.numberOfMatches() == 0) {
        statusBar()->showMessage(tr("\"%1\" not found.").arg(m_lastSearch));
    } else {
        statusBar()->showMessage(tr("\"%1\" found: %2/%3").arg(m_lastSearch,
                                                               QString::number(result.activeMatch()),
                                                               QString::number(result.numberOfMatches())));
    }
}

void BrowserWindow::startCmdThread()
{
    //call only once

    if (pCmdThread)
        return;

    pCmdThread = new cmdThread(this);

    if (! pCmdThread)
        return;

    connect(pCmdThread,
            SIGNAL(cmdSignalReceived(QString)),
            this,
            SLOT(slotCmdReceived(QString)) );

    //start thread function run
    pCmdThread->start(QThread::NormalPriority);

}

void BrowserWindow::slotCmdReceived(QString s)
{
    QString sCmd = s.simplified();
    qDebug() << "slotCmdReceived: " << sCmd;

    //QByteArray a = qgetenv("QT_IM_MODULE");
    //qDebug() << "QT_IM_MODULE: " << a.toStdString();

    //a = qgetenv("QT_VIRTUALKEYBOARD_STYLE");
    //qDebug() << "QT_VIRTUALKEYBOARD_STYLE: " << a.toStdString();

    //a = qgetenv("QT_QPA_PLATFORM_PLUGIN_PATH");
    //qDebug() << "QT_QPA_PLATFORM_PLUGIN_PATH: " << a.toStdString();

    if (sCmd.left(5) == "load=")
    {
        sCmd.remove(0,5);
        if (!sCmd.isEmpty())
        {
            loadPage(sCmd);            
        }
    }
    else if (sCmd.left(10) == "tcpmonitor")
    {
        sCmd.remove(0,10);
        if (!sCmd.isEmpty())
        {
            QStringList sList = sCmd.split("=");
            if (sList.count()==2)
            {
                WebView * pView = m_tabWidget->currentWebView();
                //qt6 pView->SetTcpRxTimestamp(sList[0], sList[1].toInt());
            }
        }
    }
    else if (sCmd.left(7) == "newtab=")
    {
        sCmd.remove(0,7);
        if (!sCmd.isEmpty())
        {
            if (m_tabWidget->count() <= MAX_TAB_COUNT)
            {
                //qt6 m_tabWidget->newTab(true);
                //loadPage(sCmd);
                m_tabWidget->createTab();
                m_tabWidget->setUrl(QUrl::fromUserInput(sCmd));
            }
        }

    }
    else if (sCmd.left(9) == "tabindex=")
    {
        sCmd.remove(0,9);
        if (!sCmd.isEmpty())
        {
            int idx = sCmd.toInt();
            if ((idx < MAX_TAB_COUNT)&&(idx >= 0))
            {
                m_tabWidget->setCurrentIndex(idx);
            }
        }

    }
    else if (sCmd.left(14) == "closetabindex=")
    {
        sCmd.remove(0,14);
        if (!sCmd.isEmpty())
        {
            int idx = sCmd.toInt();
            if ((idx < MAX_TAB_COUNT)&&(idx >= 0))
            {
                m_tabWidget->closeTab(idx);
            }
        }

    }
    else if (sCmd.left(8) == "closetab")
    {
        //close the current active tab
        sCmd.remove(0,8);
        if (sCmd.isEmpty())
        {
            m_tabWidget->closeTab(m_tabWidget->currentIndex());
        }

    }
    else if (sCmd.left(8) == "closetabs")
    {
        //close all tabs except the current active tab
        sCmd.remove(0,9);
        if (sCmd.isEmpty())
        {
            //close all tabs above current index
            int idx = m_tabWidget->currentIndex();
            int idx2remove = m_tabWidget->count() -1;
            while (idx2remove > idx)
            {
                m_tabWidget->closeTab(idx2remove);
                idx2remove = m_tabWidget->count() -1;
            }

            //close all tabs under current index
            while ((idx > 0) && (m_tabWidget->count() > 1))
            {
                m_tabWidget->closeTab(0);
            }
        }

    }
    else if (sCmd == "stop")
    {
        if (currentTab())
        {
            WebView * pView = m_tabWidget->currentWebView();
            pView->stop();
        }
    }
    else if (sCmd == "reload")
    {
        if (currentTab())
        {
            WebView * pView = m_tabWidget->currentWebView();
            pView->reload();
        }
    }
    else if (sCmd == "back")
    {
        if (currentTab())
        {
            WebView * pView = m_tabWidget->currentWebView();
            pView->back();
        }
    }
    else if (sCmd == "forward")
    {
        if (currentTab())
        {
            WebView * pView = m_tabWidget->currentWebView();
            pView->forward();
        }
    }
    else if (sCmd.left(7) == "navbar=")
    {
        // Hide and Show Navbar
        sCmd.remove(0,7);
        if (sCmd == "show")
        {
            //qt6 m_navigationBar->show();
        }
        else if (sCmd == "hide")
        {
            //qt6 m_navigationBar->hide();
        }
    }
    else if (sCmd.left(8) == "menubar=")
    {
        // Hide and Show Menubar
        sCmd.remove(0,8);
        if (sCmd == "show")
        {
            menuBar()->show();
        }
        else if (sCmd == "hide")
        {
            menuBar()->hide();
        }
    }
    else if (sCmd.left(10) == "bookmarks=")
    {
        // Hide and Show bookmarks
        sCmd.remove(0,10);
        if (sCmd == "show")
        {
            //qt6 m_bookmarksToolbar->show();
        }
        else if (sCmd == "hide")
        {
            //qt6 m_bookmarksToolbar->hide();
        }
    }
    else if (sCmd.left(7) == "tabbar=")
    {
        // Hide and Show Tabbar
        sCmd.remove(0,7);
        //qt6 QTabBar *tabBar = m_tabWidget->findChild<QTabBar *>();
        if (sCmd == "show")
        {
            //qt6 if (tabBar)
            {
                //qt6 abBar->show();
            }
        }
        else if (sCmd == "hide")
        {
            //qt6 if (tabBar)
            {
                //qt6 tabBar->hide();
            }
        }

    }
    else if (sCmd == "close")
    {
        //quitBrowser();
        close();
    }
    else if (sCmd == "clearcache")
    {
        QWebEngineProfile::defaultProfile()->clearHttpCache();
    }
    else if (sCmd == "reloadplcconfig")
    {
        //qt6 ReadPlcselectConfigFile(CONF_FILE_PLCSELECT, true);
    }
    else
    {
        qDebug() << "Tabcount: " << m_tabWidget->count();
        qDebug() << "unknown: " << sCmd;
    }

}

void BrowserWindow::loadUrl(const QUrl &url)
{
    if (!currentTab() || !url.isValid())
        return;

    m_tabWidget->setUrl(url);

    //qt6 WebView * pView = m_tabWidget->currentWebView();
    //qt6 if (pView)
    //qt6 {
        //qt6 if (pView->m_pTimerReconnect)
        //qt6     pView->m_pTimerReconnect->stop();

        //qt6 pView->stop();
        //qt6 emit pView->urlChanged(url);
        //pView->load(url);
        //emit m_tabWidget->handleCurrentChanged(m_tabWidget->currentIndex());
    //qt6 }

    //qt6 m_tabWidget->currentLineEdit()->setText(QString::fromUtf8(url.toEncoded()));
    //qt6 m_tabWidget->loadUrlInCurrentTab(url);
}

void BrowserWindow::loadPage(const QString &page)
{
    QUrl url = QUrl::fromUserInput(page);
    loadUrl(url);

}

void BrowserWindow::ReadWebengineConfigurationFile(QString sFile)
{
    g_webengine.bBookmarkbar = false;
    g_webengine.bMenubar = false;
    g_webengine.bNavbar = false;
    g_webengine.bTabbar = false;
    g_webengine.bZoom = 0;

    //wr_test //todo
    g_webengine.iReconnectInterval = 10;
    g_webengine.bReconnect = true;

    // startup configuration settings
    QSettings settings(sFile, QSettings::IniFormat);
    const QStringList allKeys = settings.allKeys();
    foreach (const QString &key, allKeys)
    {
        QString var = settings.value(key).toString();

        //qDebug() << "key: " << key << " var: " << var;

        if (key == "tabbar")
        {
            if (var.length() > 0)
            {
                if (var.compare("1", Qt::CaseInsensitive) == 0)
                {
                    g_webengine.bTabbar = true;
                }
                else
                {
                    g_webengine.bTabbar = false;
                }
            }
        }
        else if (key == "navbar")
        {
            if (var.length() > 0)
            {
                if (var.compare("1", Qt::CaseInsensitive) == 0)
                {
                    g_webengine.bNavbar = true;
                }
                else
                {
                    g_webengine.bNavbar = false;
                }
            }
        }
        else if (key == "bookmarks")
        {
            if (var.length() > 0)
            {
                if (var.compare("1", Qt::CaseInsensitive) == 0)
                {
                    g_webengine.bBookmarkbar = true;
                }
                else
                {
                    g_webengine.bBookmarkbar = false;
                }
            }
        }
        else if (key == "menubar")
        {
            if (var.length() > 0)
            {
                if (var.compare("1", Qt::CaseInsensitive) == 0)
                {
                    g_webengine.bMenubar = true;
                }
                else
                {
                    g_webengine.bMenubar = false;
                }
            }
        }
        else if (key == "tabindex")
        {
            if (var.length() > 0)
                g_webengine.iTabIndex = var.toInt();
        }
        else if (key == "zoom")
        {
            if (var.length() > 0)
            {
                if (var.compare("1", Qt::CaseInsensitive) == 0)
                {
                    g_webengine.bZoom = true;
                }
                else
                {
                    g_webengine.bZoom = false;
                }
            }
        }
        else if (key == "script")
        {
            if (var.length() > 0)
                g_webengine.sJsScriptFilename = var;
        }
        else if (key.left(12) == "Error500Text")
        {
            if (var.length() > 0)
            {
                QString sNew = var.trimmed();
                if (sNew.length() > 0)
                    g_webengine.slError5Text.append(sNew);
            }
        }
        else if (key == "ConnectText")
        {
            //ConnectText=Try to connect: %U
            if (var.length() > 0)
            {
                g_webengine.sConnectedText = var.trimmed();
            }
        }
        else if (key == "DisconnectedText")
        {
            //DisconnectedText=Connection failed: %U
            if (var.length() > 0)
            {
                g_webengine.sDisconnectedText = var.trimmed();
            }
        }

    }


    //deactivate if value is 0
    if (g_webengine.iReconnectInterval == 0)
    {
        g_webengine.bReconnect = false;
    }
    else if (g_webengine.iReconnectInterval < 5)
    {
        //min value 5
        g_webengine.iReconnectInterval = 5;
    }
    else if (g_webengine.iReconnectInterval > 99)
    {
        //max value 99
        g_webengine.iReconnectInterval = 99;
    }

    //fill with defaults if empty
    if (g_webengine.slError5Text.count() < 1)
    {
        g_webengine.slError5Text.append("500 - Internal Server Error");
        g_webengine.slError5Text.append("503 - Service Not Available");
    }

    if (g_webengine.sConnectedText.length() < 1)
    {
        g_webengine.sConnectedText = "Try to connect: %U";
    }

    if (g_webengine.sDisconnectedText.length() < 1)
    {
        g_webengine.sDisconnectedText = "Connection failed: %U";
    }

}

void BrowserWindow::ReadBrowserSecurityLevel()
{
    //qDebug() << "ReadBrowserSecurityLevel";
    QStringList stringList;
    QFile textFile( (QString)CONF_FILE_SECURITY );
    if (textFile.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        QTextStream textStream(&textFile);
        while (true)
        {
            QString line = textStream.readLine();
            if (line.isNull())
                break;
            else
                stringList.append(line.trimmed());
        }
        textFile.close();
    }

    foreach (QString s, stringList)
    {
        //qDebug() << s;
        if (s.left(12) == "low_enabled=")
        {
            s.remove(0,12);
            if (!s.isEmpty())
            {
                QStringList sl = s.split(",");
                g_sslInfo.low_enabled.clear();
                foreach (const QString &s1, sl)
                {
                    //qDebug() << s1;
                    g_sslInfo.low_enabled.append(s1.toInt());
                }
            }
        }
        else if (s.left(6) == "level=")
        {
            s.remove(0,6);
            if (!s.isEmpty())
            {
                if ( s.compare("low",  Qt::CaseInsensitive) == 0)
                    g_sslInfo.browser_security_level = BROWSER_SEC_LOW;
                else
                    g_sslInfo.browser_security_level = BROWSER_SEC_HIGH;
            }
        }

    }

}

void BrowserWindow::ReadSslAllowedFromFile()
{
    //qDebug() << "ReadSslAllowedFromFile";
    QFile inputFile(CONF_FILE_SSLALLOWED);
    if (inputFile.open(QIODevice::ReadOnly))
    {
        QTextStream in(&inputFile);
        while (!in.atEnd())
        {
            QString line = in.readLine().trimmed();
            QStringList sl = line.split("=");
            if (sl.size() == 2)
            {
                QString sHost = sl.at(0);
                QString sSslCodes = sl.at(1);
                sHost = sHost.trimmed();
                sSslCodes = sSslCodes.trimmed();
                WebView * pView = m_tabWidget->currentWebView();

                QStringList slCodes = sSslCodes.split(",");
                foreach (const QString &s, slCodes)
                {
                    //qDebug() << s;
                    QString sCode = s.trimmed();
                    //qDebug() << sHost << " " << sCode;

                    if (pView)
                        pView->setSslErrorConfirmed(sHost, sCode.toInt());
                }
            }
        }
        inputFile.close();
    }
}

/// \brief create a custom user-agent-string
///
void BrowserWindow::CreateUserAgentString()
{
  //description
  //… Wago/Major.Minor.Bugfix (Display=<big, medium, small>,<Portait, Landscape>)
  //Beispiel:
  //Mozilla/5.0 (X11; N; Linux) AppleWebKit/534.34 (KHTML, like Gecko) Qt/4.8.4 Safari/534.34 Wago/00.01.02 (Display=big, Landscape)
  //Mozilla/5.0 (X11; N; Linux) AppleWebKit/537.36 (KHTML, like Gecko) QtWebEngine/5.9.4 Chrome/53.0.2785.148 Safari/537.36

  QString sFwVer = "00.00.00";
  ReadSwVersionFromConfigTool(sFwVer);

  QWebEngineProfile *defaultProfile = QWebEngineProfile::defaultProfile();
  if (defaultProfile)
  {
    m_sUserAgent = defaultProfile->httpUserAgent();
  }
  else
  {
    m_sUserAgent = "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) QtWebEngine/6.6.2 Chrome/112.0.5615.213 Safari/537.36";
  }

  DISPLAY_SIZE displaySize = GetDisplaySize();
  DISPLAY_ORIENTATION displayOrientation = GetDisplayOrientation();

  QString sOrientation = "Landscape";
  if (displayOrientation == DISPLAY_PORTRAIT)
  {
    sOrientation = "Portrait";
  }

  switch (displaySize)
  {
    case DISPLAY_SMALL:
      m_sUserAgent += " Wago/" + sFwVer + " (Display=small, " + sOrientation + ")";
      break;

    case DISPLAY_MEDIUM:
      m_sUserAgent += " Wago/" + sFwVer + " (Display=medium, " + sOrientation + ")";
      break;

    case DISPLAY_BIG:
      m_sUserAgent += " Wago/" + sFwVer + " (Display=big, " + sOrientation + ")";
      break;

  }

}

/// \brief read software version from config-tool
/// \param[out]  sFirmwareVersion
/// \retval true   SUCCESS
/// \retval false  ERROR
bool BrowserWindow::ReadSwVersionFromConfigTool(QString &sFirmwareVersion)
{
  static QString savedVersion = "";
  //read only once
  if (savedVersion.length() > 0)
  {
    sFirmwareVersion = savedVersion;
    return true;
  }

  //get plc-list url from config-tool index 1
  bool bRet = false;
  QByteArray output;
  QProcess System_Call;
  System_Call.start("/etc/config-tools/get_coupler_details", QStringList() << "firmware-revision");
  System_Call.waitForFinished(5000);
  output = System_Call.readAllStandardOutput();
  System_Call.close();
  QString sVer = output;

  QUrl u(sVer);
  if (u.isValid())
  {
    sFirmwareVersion = sVer;
    //qDebug() << "webkit: QProcess sFirmwareVersion: " << sFirmwareVersion;
    savedVersion = sFirmwareVersion;
    bRet = true;
  }
  return bRet;
}

