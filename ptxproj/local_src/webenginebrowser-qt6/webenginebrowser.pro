TEMPLATE = app
TARGET = webenginebrowser
QT += webenginewidgets

LIBS += -lmsgtool

HEADERS += \
    browser.h \
    browserwindow.h \
    downloadmanagerwidget.h \
    downloadwidget.h \
    tabwidget.h \
    webpage.h \
    webpopupwindow.h \
    webview.h \
    globals.h \
    alarmindication.h \
    cmdthread.h \
    tools.h

SOURCES += \
    browser.cpp \
    browserwindow.cpp \
    downloadmanagerwidget.cpp \
    downloadwidget.cpp \
    main.cpp \
    tabwidget.cpp \
    webpage.cpp \
    webpopupwindow.cpp \
    webview.cpp \
    globals.cpp \
    alarmindication.cpp \
    cmdthread.cpp \
    tools.cpp

FORMS += \
    certificateerrordialog.ui \
    passworddialog.ui \
    downloadmanagerwidget.ui \
    downloadwidget.ui

RESOURCES += data/webenginebrowser.qrc

# install
include(install.pri)
