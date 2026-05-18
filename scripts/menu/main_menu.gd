extends Control
class_name MainMenu

@onready var sfx_music: AudioStreamPlayer = $SFX_music

func _ready() -> void:
	sfx_music.play()

func _on_new_game_pressed():
	global.transition_scene = true
	global.change_scene(global.forest_scene, sfx_music)

func _on_exit_pressed():
	get_tree().quit()
