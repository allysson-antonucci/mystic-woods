extends EnemyState
class_name EnemyDead

func Enter():
	enemyAnimation.play("enemy_dead")
	
	enemy.sfx_enemy_dying.play()

func _on_enemy_animation_animation_finished(anim_name):
	if anim_name == "enemy_dead":
		enemy.queue_free()
		
