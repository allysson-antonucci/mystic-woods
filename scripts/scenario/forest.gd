extends Node2D
class_name Forest

@onready var player : Player = $Player
@onready var sfx_music = $Audio/SFX_music

func _ready():
	player.global_position = get_node_or_null("DeepForest_entrance/Forest_spawn").global_position
	global.change_camera_limit()
	sfx_music.play()
	
	player.dead.connect(player_died)

func player_died():
	global.transition_scene = true
	global.change_scene(global.dead_menu_scene, sfx_music)
