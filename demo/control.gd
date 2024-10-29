extends Control

var webkit_plugin

func _ready():
	if Engine.has_singleton("WebKit"):
		print("iOS WebKit plugin found!")
		webkit_plugin = Engine.get_singleton("WebKit")
		webkit_plugin.print_version()
	else:
		print("iOS WebKit plugin is not available on this platform.")

func _on_button_pressed():
	webkit_plugin.print_version()


func _on_button_2_pressed():
	webkit_plugin.open_auth_url("https://decentraland.org/auth/")
