extends Control

var webkit_plugin

func _ready():
	if Engine.has_singleton("WebKit"):
		print("iOS WebKit plugin found!")
		webkit_plugin = Engine.get_singleton("WebKit")
		webkit_plugin.hello_world()
	else:
		print("iOS WebKit plugin is not available on this platform.")

func _on_button_pressed():
	webkit_plugin.hello_world()


func _on_button_2_pressed():
	webkit_plugin.open_auth_url("https://decentraland.org/auth/requests/86d1027e-1e79-4e1d-8ebe-f34dd4938b1c?targetConfigId=alternative", "Hello world!")
