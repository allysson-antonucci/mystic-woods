extends Control
class_name Dead_menu

@onready var sfx_music: AudioStreamPlayer = $SFX_music

func _ready() -> void:
	sfx_music.play()

func _on_yes_button_pressed():
	global.transition_scene = true
	global.change_scene(global.forest_scene, sfx_music)

func _on_no_button_pressed():
	global.transition_scene = true
	global.change_scene(global.menu_scene, sfx_music)
