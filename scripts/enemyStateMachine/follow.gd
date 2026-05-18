extends EnemyState
class_name EnemyFollow

func Enter():
	enemy.sfx_follow_timer.start()
	enemy.enemySpeed = 35

func Exit():
	enemy.health_regen_timer.start()
	enemy.sfx_follow_timer.stop()

func Update(_delta : float) -> void:
	raycast.target_position = enemy.direction_to_player
	if raycast.get_collider() is Player and enemy.player_in_area:
		if enemy.direction_to_player.angle() < -PI / 3 and enemy.direction_to_player.angle() > - 2 * PI / 3:
			enemyAnimation.play("enemy_follow_up")
		elif enemy.direction_to_player.angle() > PI / 3 and enemy.direction_to_player.angle() < 2 * PI / 3:
			enemyAnimation.play("enemy_follow_down")
		else:
			verifyPosition(enemy.direction_to_player)
			enemyAnimation.play("enemy_follow_right")
	else:
		enemyChangeState.emit("Idle")

func Physics_update(_delta : float) -> void:
	enemy.velocity = enemy.direction_to_player.normalized() * enemy.enemySpeed
	enemy.move_and_slide()

func _on_sfx_follow_timer_timeout():
	enemy.sfx_enemy_follow.play()
