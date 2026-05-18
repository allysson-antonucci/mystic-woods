extends CharacterBody2D
class_name Enemy

var enemyHealth : int = 100
@onready var health_bar : ProgressBar = $HealthBar
var enemySpeed : int = 0
var direction_to_player : Vector2
var enemy_last_direction_looked : Vector2 = Vector2.DOWN # Inicia olhando pra baixo

var player_in_area : bool = false # Diz se o player entrou na área de detectação do inimigo

# Efeitos sonoros
@onready var sfx_enemy_hurt : AudioStreamPlayer = $Audio/SFX_enemy_hurt
@onready var sfx_enemy_dying : AudioStreamPlayer= $Audio/SFX_enemy_dying
@onready var sfx_enemy_follow : AudioStreamPlayer = $Audio/SFX_enemy_follow

#Timers
@onready var health_regen_timer = $Health_regen_timer
@onready var sfx_follow_timer = $SFX_follow_timer

func _process(_delta):
	var player = get_tree().current_scene.get_node_or_null("Player")
	if player:
		direction_to_player = player.position - position
	else:
		direction_to_player = Vector2.LEFT
	
	enemy_last_direction_looked = direction_to_player.normalized()

# Se o inimigo leva um hit, acessa diretamente o state de takeDamage, independente do State que ele está
func _on_hurtbox_area_entered(_area):
	get_node("StateMachine").enemy_child_transitioned("TakeDamage")

func _on_detection_area_body_entered(body):
	if body is Player:
		player_in_area = true

func _on_detection_area_body_exited(body):
	if body is Player:
		player_in_area = false

func _on_health_regen_timer_timeout():
	if enemyHealth < 100:
		enemyHealth += 5
		health_bar.value = enemyHealth
	else:
		health_bar.visible = false
