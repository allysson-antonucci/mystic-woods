extends Node2D
class_name DeepForest

@onready var player = $Player
@onready var sfx_music: AudioStreamPlayer = $Audio/SFX_music

func _ready():
	player.global_position = get_node_or_null("DeepForest_exit/Deep_forest_spawn").global_position
	global.change_camera_limit()
	sfx_music.play()
