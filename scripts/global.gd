extends Node

#Scenes
var forest_scene : PackedScene = preload("res://scenes/Forest.tscn") # O preload carrega a cena no carregamento do script, não em tempo de execução.
var deep_forest_scene : PackedScene = preload("res://scenes/Deep_forest.tscn")
var menu_scene : PackedScene = preload("res://scenes/ui/Main_menu.tscn")
var dead_menu_scene : PackedScene = preload("res://scenes/ui/Dead.tscn")

var transition_scene : bool = false
var spawn_name : String = ""

var is_music_fading : bool = false # Para evitar duplicar o twenn caso chame a função de fade várias vezes

func change_scene(new_scene : PackedScene, music : AudioStreamPlayer):
	if transition_scene:
		if is_music_fading:
			return
		is_music_fading = true
		var tween : Tween =  create_tween()
		tween.tween_property(music, "volume_db", -40, 1) # Altera o volume_db da music para -40 em 1 segundo gradativamente
		tween.tween_callback(func(): 
			SceneFade.transition()
			await SceneFade.transition_finished
			get_tree().change_scene_to_packed(new_scene) # Após chegar em -40 depois de 1 segundo, troca de cena
			transition_scene = false
			is_music_fading = false
		)


func change_camera_limit() -> void:
	var player : Player = get_tree().get_current_scene().get_node_or_null("Player")
	var scene_camera_limit_node : Node2D = get_tree().get_current_scene().get_node_or_null("Camera_limit")
	
	if scene_camera_limit_node:
		var left : float = scene_camera_limit_node.get_node_or_null("Left").global_position.x
		var top : float = scene_camera_limit_node.get_node_or_null("Top").global_position.y
		var right : float = scene_camera_limit_node.get_node_or_null("Right").global_position.x
		var bottom : float = scene_camera_limit_node.get_node_or_null("Bottom").global_position.y
		
		player.get_node_or_null("Camera").limit_left = left
		player.get_node_or_null("Camera").limit_top = top
		player.get_node_or_null("Camera").limit_right = right
		player.get_node_or_null("Camera").limit_bottom = bottom
