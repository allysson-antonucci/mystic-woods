extends CanvasLayer

@onready var fade: ColorRect = $Fade
@onready var fade_animation: AnimationPlayer = $FadeAnimation

signal transition_finished

func _ready() -> void:
	fade.visible = false

func transition():
	fade.visible = true
	fade_animation.play("fade_to_black")

func _on_fade_animation_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_to_black":
		transition_finished.emit()
		fade_animation.play("fade_to_normal")
	elif anim_name == "fade_to_normal":
		fade.visible = false
