extends Node
class_name EnemyStateMachine

@export var current_state : EnemyState
var states : Dictionary = {}

func _ready():
	for child in get_children():
		if child is EnemyState:
			states[child.name] = child
			child.enemyChangeState.connect(enemy_child_transitioned)
		else:
			push_warning("Enemy State Machine contains a child which is not a state!")
		current_state.Enter()

func enemy_child_transitioned(new_state_name : StringName) -> void:
	var new_state = states.get(new_state_name)
	if new_state != null:
		if new_state != current_state:
			current_state.Exit()
			new_state.Enter()
			current_state = new_state
	else:
		push_warning("Called enemy_child_transitioned() on a state that does not exist!")

func _process(delta):
	current_state.Update(delta)

func _physics_process(delta):
	current_state.Physics_update(delta)
