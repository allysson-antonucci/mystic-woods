extends State
class_name Idle

func Update(_delta : float) -> void:
	if player.last_direction_looked == Vector2.DOWN:
		animation.play("idle_down")
	elif player.last_direction_looked == Vector2.UP:
		animation.play("idle_up")
	else:
		verifyPosition(player.last_direction_looked)
		animation.play("idle_right")
	
	if player.input_direction != Vector2.ZERO:
		changeState.emit("Run")
	if Input.is_action_just_pressed("attack"):
		changeState.emit("Attack")
	
	
	
