extends WindowDialog

onready var host:LineEdit = $VB/GC/Host
onready var port:LineEdit = $VB/GC/Port
onready var password:LineEdit = $VB/GC/Password
onready var obs:ObsWs = get_parent().get_node("ObsWs")



func _on_Connect_pressed() -> void:
	obs.host = host.text
	obs.port = port.text
	obs.password = password.text
	obs.connect("obs_connected", self, "_on_obs_connected")
	obs.connect_to_host()

func _on_obs_connected() -> void:
	self.hide()
	obs.disconnect("obs_connected", self, "_on_obs_connected")
