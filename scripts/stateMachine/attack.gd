extends State
class_name Attack

func Enter():
	player.sfx_player_attack.play()
	
	if abs(player.last_direction_looked.x) >= abs(player.last_direction_looked.y):
		verifyPosition(player.last_direction_looked)
		animation.play("attack_right")
	else:
		animation.play("attack_down" if player.last_direction_looked.y >=0 else "attack_up")

func Exit():
	player.sfx_player_attack.pitch_scale = randf_range(0.7,1.2) # Isso altera um pouco o som da próximo ataque da espada

func _on_animation_animation_finished(anim_name):
	if anim_name.begins_with("attack"):
		if player.input_direction != Vector2.ZERO:
			changeState.emit("Run")
		else:
			changeState.emit("Idle")
	
