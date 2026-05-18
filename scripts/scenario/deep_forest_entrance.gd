extends Area2D
class_name DeepForest_entrance

var deep_forest_spawn : String = "Deep_forest_spawn"

func _on_body_entered(body):
	if body is Player:
		global.transition_scene = true
		global.spawn_name = deep_forest_spawn
		global.call_deferred("change_scene", global.deep_forest_scene, owner.sfx_music) # O call_deferred é para evitar o erro que ocorre ao tentar mudar de cena enquanto ainda está processando um sinal físico como body_entered
