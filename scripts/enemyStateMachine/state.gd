extends Node
class_name EnemyState

signal enemyChangeState(new_state_name : StringName)

@export var enemy : Enemy
@export var enemyAnimation : AnimationPlayer 
@export var enemyTexture : Sprite2D
@export var enemyInteractionArea : CollisionShape2D
@onready var raycast : RayCast2D = $"../../EnemyRayCast"

func Enter():
	pass 

func Exit():
	pass

func Update(_delta : float) -> void:
	pass

func Physics_update(_delta : float) -> void:
	pass

# Flipa a texture do inimigo. Será usada para fazer as animações que apontam para esquerda
func verifyPosition(direction: Vector2) -> void:
	if direction.x > 0:
		enemyTexture.flip_h = false
	elif direction.x < 0:
		enemyTexture.flip_h = true
