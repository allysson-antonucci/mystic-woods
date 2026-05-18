extends EnemyState
class_name EnemyTakeDamage

var knockback_duration : float
var knockback_force : int = -50

func Enter():
	enemy.enemyHealth -= 20
	knockback_duration = 0.2
	
	enemy.health_bar.visible = true 
	enemy.health_bar.value = enemy.enemyHealth
	
	enemy.sfx_enemy_hurt.play() 

func Exit():
	enemyTexture.modulate = Color.WHITE

func Update(_delta : float) -> void:
	enemyTexture.modulate = Color.RED # Muda de cor ao levar dano. Como na Physics_update troca de estado de acordo com o knockback_duration, a cor terá esse tempo

func Physics_update(_delta : float) -> void:
	if knockback_duration > 0:
		knockback_duration -= _delta
		
		enemy.velocity = enemy.direction_to_player.normalized() * knockback_force
		enemy.move_and_slide()
	else:
		if enemy.enemyHealth <= 0:
			enemyChangeState.emit("Dead")
		else: 
			enemyChangeState.emit("Follow")
