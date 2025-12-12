/****************************************************************************
** Meta object code from reading C++ file 'webview.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.6.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "webview.h"
#include <QtGui/qtextcursor.h>
#include <QtCore/qmetatype.h>

#if __has_include(<QtCore/qtmochelpers.h>)
#include <QtCore/qtmochelpers.h>
#else
QT_BEGIN_MOC_NAMESPACE
#endif


#include <memory>

#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'webview.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.6.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {

#ifdef QT_MOC_HAS_STRINGDATA
struct qt_meta_stringdata_CLASSWebViewENDCLASS_t {};
constexpr auto qt_meta_stringdata_CLASSWebViewENDCLASS = QtMocHelpers::stringData(
    "WebView",
    "webActionEnabledChanged",
    "",
    "QWebEnginePage::WebAction",
    "webAction",
    "enabled",
    "favIconChanged",
    "icon",
    "devToolsRequested",
    "QWebEnginePage*",
    "source",
    "handleCertificateError",
    "QWebEngineCertificateError",
    "error",
    "handleAuthenticationRequired",
    "requestUrl",
    "QAuthenticator*",
    "auth",
    "handleFeaturePermissionRequested",
    "securityOrigin",
    "QWebEnginePage::Feature",
    "feature",
    "handleProxyAuthenticationRequired",
    "proxyHost",
    "handleRegisterProtocolHandlerRequested",
    "QWebEngineRegisterProtocolHandlerRequest",
    "request",
    "handleFileSystemAccessRequested",
    "QWebEngineFileSystemAccessRequest",
    "onShowReconnectPage",
    "onReconnect",
    "onCheckError500InternalServerError",
    "onShowWbm",
    "sWbm"
);
#else  // !QT_MOC_HAS_STRING_DATA
struct qt_meta_stringdata_CLASSWebViewENDCLASS_t {
    uint offsetsAndSizes[68];
    char stringdata0[8];
    char stringdata1[24];
    char stringdata2[1];
    char stringdata3[26];
    char stringdata4[10];
    char stringdata5[8];
    char stringdata6[15];
    char stringdata7[5];
    char stringdata8[18];
    char stringdata9[16];
    char stringdata10[7];
    char stringdata11[23];
    char stringdata12[27];
    char stringdata13[6];
    char stringdata14[29];
    char stringdata15[11];
    char stringdata16[16];
    char stringdata17[5];
    char stringdata18[33];
    char stringdata19[15];
    char stringdata20[24];
    char stringdata21[8];
    char stringdata22[34];
    char stringdata23[10];
    char stringdata24[39];
    char stringdata25[41];
    char stringdata26[8];
    char stringdata27[32];
    char stringdata28[34];
    char stringdata29[20];
    char stringdata30[12];
    char stringdata31[35];
    char stringdata32[10];
    char stringdata33[5];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_CLASSWebViewENDCLASS_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_CLASSWebViewENDCLASS_t qt_meta_stringdata_CLASSWebViewENDCLASS = {
    {
        QT_MOC_LITERAL(0, 7),  // "WebView"
        QT_MOC_LITERAL(8, 23),  // "webActionEnabledChanged"
        QT_MOC_LITERAL(32, 0),  // ""
        QT_MOC_LITERAL(33, 25),  // "QWebEnginePage::WebAction"
        QT_MOC_LITERAL(59, 9),  // "webAction"
        QT_MOC_LITERAL(69, 7),  // "enabled"
        QT_MOC_LITERAL(77, 14),  // "favIconChanged"
        QT_MOC_LITERAL(92, 4),  // "icon"
        QT_MOC_LITERAL(97, 17),  // "devToolsRequested"
        QT_MOC_LITERAL(115, 15),  // "QWebEnginePage*"
        QT_MOC_LITERAL(131, 6),  // "source"
        QT_MOC_LITERAL(138, 22),  // "handleCertificateError"
        QT_MOC_LITERAL(161, 26),  // "QWebEngineCertificateError"
        QT_MOC_LITERAL(188, 5),  // "error"
        QT_MOC_LITERAL(194, 28),  // "handleAuthenticationRequired"
        QT_MOC_LITERAL(223, 10),  // "requestUrl"
        QT_MOC_LITERAL(234, 15),  // "QAuthenticator*"
        QT_MOC_LITERAL(250, 4),  // "auth"
        QT_MOC_LITERAL(255, 32),  // "handleFeaturePermissionRequested"
        QT_MOC_LITERAL(288, 14),  // "securityOrigin"
        QT_MOC_LITERAL(303, 23),  // "QWebEnginePage::Feature"
        QT_MOC_LITERAL(327, 7),  // "feature"
        QT_MOC_LITERAL(335, 33),  // "handleProxyAuthenticationRequ..."
        QT_MOC_LITERAL(369, 9),  // "proxyHost"
        QT_MOC_LITERAL(379, 38),  // "handleRegisterProtocolHandler..."
        QT_MOC_LITERAL(418, 40),  // "QWebEngineRegisterProtocolHan..."
        QT_MOC_LITERAL(459, 7),  // "request"
        QT_MOC_LITERAL(467, 31),  // "handleFileSystemAccessRequested"
        QT_MOC_LITERAL(499, 33),  // "QWebEngineFileSystemAccessReq..."
        QT_MOC_LITERAL(533, 19),  // "onShowReconnectPage"
        QT_MOC_LITERAL(553, 11),  // "onReconnect"
        QT_MOC_LITERAL(565, 34),  // "onCheckError500InternalServer..."
        QT_MOC_LITERAL(600, 9),  // "onShowWbm"
        QT_MOC_LITERAL(610, 4)   // "sWbm"
    },
    "WebView",
    "webActionEnabledChanged",
    "",
    "QWebEnginePage::WebAction",
    "webAction",
    "enabled",
    "favIconChanged",
    "icon",
    "devToolsRequested",
    "QWebEnginePage*",
    "source",
    "handleCertificateError",
    "QWebEngineCertificateError",
    "error",
    "handleAuthenticationRequired",
    "requestUrl",
    "QAuthenticator*",
    "auth",
    "handleFeaturePermissionRequested",
    "securityOrigin",
    "QWebEnginePage::Feature",
    "feature",
    "handleProxyAuthenticationRequired",
    "proxyHost",
    "handleRegisterProtocolHandlerRequested",
    "QWebEngineRegisterProtocolHandlerRequest",
    "request",
    "handleFileSystemAccessRequested",
    "QWebEngineFileSystemAccessRequest",
    "onShowReconnectPage",
    "onReconnect",
    "onCheckError500InternalServerError",
    "onShowWbm",
    "sWbm"
};
#undef QT_MOC_LITERAL
#endif // !QT_MOC_HAS_STRING_DATA
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_CLASSWebViewENDCLASS[] = {

 // content:
      12,       // revision
       0,       // classname
       0,    0, // classinfo
      13,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    2,   92,    2, 0x06,    1 /* Public */,
       6,    1,   97,    2, 0x06,    4 /* Public */,
       8,    1,  100,    2, 0x06,    6 /* Public */,

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
      11,    1,  103,    2, 0x08,    8 /* Private */,
      14,    2,  106,    2, 0x08,   10 /* Private */,
      18,    2,  111,    2, 0x08,   13 /* Private */,
      22,    3,  116,    2, 0x08,   16 /* Private */,
      24,    1,  123,    2, 0x08,   20 /* Private */,
      27,    1,  126,    2, 0x08,   22 /* Private */,
      29,    0,  129,    2, 0x08,   24 /* Private */,
      30,    0,  130,    2, 0x08,   25 /* Private */,
      31,    0,  131,    2, 0x08,   26 /* Private */,
      32,    1,  132,    2, 0x0a,   27 /* Public */,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3, QMetaType::Bool,    4,    5,
    QMetaType::Void, QMetaType::QIcon,    7,
    QMetaType::Void, 0x80000000 | 9,   10,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 12,   13,
    QMetaType::Void, QMetaType::QUrl, 0x80000000 | 16,   15,   17,
    QMetaType::Void, QMetaType::QUrl, 0x80000000 | 20,   19,   21,
    QMetaType::Void, QMetaType::QUrl, 0x80000000 | 16, QMetaType::QString,   15,   17,   23,
    QMetaType::Void, 0x80000000 | 25,   26,
    QMetaType::Void, 0x80000000 | 28,   26,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,   33,

       0        // eod
};

Q_CONSTINIT const QMetaObject WebView::staticMetaObject = { {
    QMetaObject::SuperData::link<QWebEngineView::staticMetaObject>(),
    qt_meta_stringdata_CLASSWebViewENDCLASS.offsetsAndSizes,
    qt_meta_data_CLASSWebViewENDCLASS,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_CLASSWebViewENDCLASS_t,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<WebView, std::true_type>,
        // method 'webActionEnabledChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QWebEnginePage::WebAction, std::false_type>,
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        // method 'favIconChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QIcon &, std::false_type>,
        // method 'devToolsRequested'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QWebEnginePage *, std::false_type>,
        // method 'handleCertificateError'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QWebEngineCertificateError, std::false_type>,
        // method 'handleAuthenticationRequired'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QUrl &, std::false_type>,
        QtPrivate::TypeAndForceComplete<QAuthenticator *, std::false_type>,
        // method 'handleFeaturePermissionRequested'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QUrl &, std::false_type>,
        QtPrivate::TypeAndForceComplete<QWebEnginePage::Feature, std::false_type>,
        // method 'handleProxyAuthenticationRequired'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QUrl &, std::false_type>,
        QtPrivate::TypeAndForceComplete<QAuthenticator *, std::false_type>,
        QtPrivate::TypeAndForceComplete<const QString &, std::false_type>,
        // method 'handleRegisterProtocolHandlerRequested'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QWebEngineRegisterProtocolHandlerRequest, std::false_type>,
        // method 'handleFileSystemAccessRequested'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QWebEngineFileSystemAccessRequest, std::false_type>,
        // method 'onShowReconnectPage'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'onReconnect'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'onCheckError500InternalServerError'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'onShowWbm'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>
    >,
    nullptr
} };

void WebView::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<WebView *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->webActionEnabledChanged((*reinterpret_cast< std::add_pointer_t<QWebEnginePage::WebAction>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<bool>>(_a[2]))); break;
        case 1: _t->favIconChanged((*reinterpret_cast< std::add_pointer_t<QIcon>>(_a[1]))); break;
        case 2: _t->devToolsRequested((*reinterpret_cast< std::add_pointer_t<QWebEnginePage*>>(_a[1]))); break;
        case 3: _t->handleCertificateError((*reinterpret_cast< std::add_pointer_t<QWebEngineCertificateError>>(_a[1]))); break;
        case 4: _t->handleAuthenticationRequired((*reinterpret_cast< std::add_pointer_t<QUrl>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QAuthenticator*>>(_a[2]))); break;
        case 5: _t->handleFeaturePermissionRequested((*reinterpret_cast< std::add_pointer_t<QUrl>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QWebEnginePage::Feature>>(_a[2]))); break;
        case 6: _t->handleProxyAuthenticationRequired((*reinterpret_cast< std::add_pointer_t<QUrl>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QAuthenticator*>>(_a[2])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[3]))); break;
        case 7: _t->handleRegisterProtocolHandlerRequested((*reinterpret_cast< std::add_pointer_t<QWebEngineRegisterProtocolHandlerRequest>>(_a[1]))); break;
        case 8: _t->handleFileSystemAccessRequested((*reinterpret_cast< std::add_pointer_t<QWebEngineFileSystemAccessRequest>>(_a[1]))); break;
        case 9: _t->onShowReconnectPage(); break;
        case 10: _t->onReconnect(); break;
        case 11: _t->onCheckError500InternalServerError(); break;
        case 12: _t->onShowWbm((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
        case 2:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QWebEnginePage* >(); break;
            }
            break;
        case 3:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QWebEngineCertificateError >(); break;
            }
            break;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (WebView::*)(QWebEnginePage::WebAction , bool );
            if (_t _q_method = &WebView::webActionEnabledChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (WebView::*)(const QIcon & );
            if (_t _q_method = &WebView::favIconChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (WebView::*)(QWebEnginePage * );
            if (_t _q_method = &WebView::devToolsRequested; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 2;
                return;
            }
        }
    }
}

const QMetaObject *WebView::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *WebView::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CLASSWebViewENDCLASS.stringdata0))
        return static_cast<void*>(this);
    return QWebEngineView::qt_metacast(_clname);
}

int WebView::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QWebEngineView::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 13)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 13;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 13)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 13;
    }
    return _id;
}

// SIGNAL 0
void WebView::webActionEnabledChanged(QWebEnginePage::WebAction _t1, bool _t2)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t2))) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void WebView::favIconChanged(const QIcon & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void WebView::devToolsRequested(QWebEnginePage * _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}
QT_WARNING_POP
