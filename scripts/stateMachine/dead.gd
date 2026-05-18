extends State
class_name Dead

func Enter() -> void:
	player.sfx_player_dead.play()
	animation.play("death")

func _on_sfx_player_dead_finished() -> void:
	player.emit_signal("dead")
