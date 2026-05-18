extends Area2D
class_name DeepForest_exit

var forest_spawn_name : String = "Forest_spawn"

func _on_body_entered(body):
	if body is Player:
		global.transition_scene = true
		global.spawn_name = forest_spawn_name
		global.call_deferred("change_scene", global.forest_scene, owner.sfx_music)
