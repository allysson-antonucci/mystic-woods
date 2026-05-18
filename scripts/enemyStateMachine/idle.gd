extends EnemyState
class_name EnemyIdle

var player_detected : bool = false

func Enter():
	enemy.enemySpeed = 0

func Exit():
	enemy.health_regen_timer.stop()

func Update(_delta : float) -> void:
	raycast.target_position = enemy.direction_to_player
	player_detected = true if raycast.get_collider() is Player else false
	
	if enemy.player_in_area:
		if player_detected:
			enemyChangeState.emit("Follow")
	
	if enemy.enemy_last_direction_looked.angle() < -PI / 3 and enemy.enemy_last_direction_looked.angle() > - 2 * PI / 3:
		enemyAnimation.play("enemy_idle_up")
	elif enemy.enemy_last_direction_looked.angle() > PI / 3 and enemy.enemy_last_direction_looked.angle() < 2 * PI / 3: 
		enemyAnimation.play("enemy_idle_down")
	else:
		verifyPosition(enemy.direction_to_player)
		enemyAnimation.play("enemy_idle_right")
