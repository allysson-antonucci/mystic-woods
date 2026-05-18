extends CharacterBody2D
class_name Player

@export var speed : int

var input_direction : Vector2
var last_direction_looked : Vector2 = Vector2.DOWN # Inicia olhando pra baixo

# Efeitos sonoros
@onready var sfx_player_attack : AudioStreamPlayer = $Audio/SFX_player_attack
@onready var sfx_player_dead = $Audio/SFX_player_dead
@onready var sfx_player_run = $Audio/SFX_player_run

# Timer
@onready var sfx_run_timer: Timer = $SFX_run_timer

# Signals
signal dead

func _process(_delta):
	if global.transition_scene: # Se estiver trocando de cena
		return
		
	input_direction = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")).normalized()
	
	if input_direction != Vector2.ZERO: # Última direção que o player olhou ao se mover, será usado para as animações
		last_direction_looked = input_direction

# acessa diretamente o state de Dead, independente do State que ele está
func _on_hurtbox_area_entered(_area):
	get_node("StateMachine").child_transitioned("Dead")
