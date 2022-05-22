extends Control

var is_fading = false setget set_is_fading

signal transitioned 


func _ready():
	transition()

func transition():
	self.is_fading = !is_fading
	$AnimationPlayer.play("fade to black")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade to black":
		emit_signal("transitioned")
		$AnimationPlayer.play("fade to normal")

func set_is_fading(value):
	is_fading = value
	visible = is_fading
	
