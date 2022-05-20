extends Control

var is_paused = false setget set_is_paused

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		self.is_paused = !is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused


func _on_resume_pressed():
	#is_paused = false
	pass


func _on_return_pressed():
	#is_paused = false
	get_tree().change_scene("res://scenes/main_menu.tscn")