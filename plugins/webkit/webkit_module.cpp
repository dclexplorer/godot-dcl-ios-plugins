#include "webkit_module.h"

#include "core/config/engine.h"

#include "webkit.h"

WebKit *webkit;

void register_webkit_types() {
	webkit = memnew(WebKit);
	Engine::get_singleton()->add_singleton(Engine::Singleton("WebKit", webkit));
}

void unregister_webkit_types() {
	if (webkit) {
		memdelete(webkit);
	}
}
