#ifndef WEB_KIT_H
#define WEB_KIT_H

#include "core/version.h"

#if VERSION_MAJOR == 4
#include "core/object/class_db.h"
#else
#include "core/object.h"
#endif

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
    void open_auth_url(String url, String notification_message);

    static WebKit *get_singleton();

    WebKit();
    ~WebKit();
};

#endif // WEB_KIT_H
