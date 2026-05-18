extends Node
class_name State

signal changeState(new_state_name : StringName)

@export var player : Player
@export var animation : AnimationPlayer
@export var texture : Sprite2D

func Enter() -> void: #Só roda 1 vez, quando você entra no estado (Alterar valores de variáveis para aquele estado, entre outras coisas...)
	pass

func Exit() -> void:
	pass

func Update(_delta : float) -> void:
	pass

func Physics_update(_delta : float):
	pass

# Flipa a texture do Player. Será usada para fazer as animações que apontam para esquerda
func verifyPosition(direction: Vector2) -> void:
	if direction.x >= 0:
		texture.flip_h = false
		$"../../Hitbox/Attack_right".position.x = 10.75
	else:
		texture.flip_h = true
		$"../../Hitbox/Attack_right".position.x = -10.75
