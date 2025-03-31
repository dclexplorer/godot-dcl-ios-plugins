#ifndef WEB_KIT_H
#define WEB_KIT_H

#include "core/object/class_db.h"
#include "core/version.h"

#ifdef __OBJC__
@class ASWebAuthenticationSession;
@class WebKitAuthenticationDelegate;
#else
typedef void ASWebAuthenticationSession;
typedef void WebKitAuthenticationDelegate;
#endif

class WebKit : public Object {
    GDCLASS(WebKit, Object);

    static WebKit *instance;
    static void _bind_methods();

    ASWebAuthenticationSession *authSession;
    WebKitAuthenticationDelegate *authDelegate;

public:
    void print_version();
    void open_auth_url(String url);
    void open_webview_url(String url);

    static WebKit *get_singleton();

    WebKit();
    ~WebKit();
};

#endif // WEB_KIT_H
