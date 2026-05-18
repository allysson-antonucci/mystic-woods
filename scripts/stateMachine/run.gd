extends State
class_name Run

func Enter():
	player.sfx_run_timer.start()
	player.sfx_player_run.play()

func Exit():
	player.sfx_run_timer.stop()

func Update(_delta : float) -> void:
	if player.input_direction != Vector2.ZERO:
		if abs(player.input_direction.x) >= abs(player.input_direction.y):
			verifyPosition(player.input_direction)
			animation.play("run_right")
		else:
			animation.play("run_down" if player.input_direction.y >= 0 else "run_up")
		
		if Input.is_action_just_pressed("attack"):
			changeState.emit("Attack")
	else:
		changeState.emit("Idle")

func Physics_update(_delta : float) -> void:
	player.velocity = player.input_direction * player.speed
	player.move_and_slide()
	player.global_position = player.global_position.round() #Evita jitter de pixel art por posição fracionária

func _on_timer_timeout() -> void:
	player.sfx_player_run.pitch_scale = randf_range(0.7,1.2) #Altera um pouco o som de cada passo
	player.sfx_player_run.play()
