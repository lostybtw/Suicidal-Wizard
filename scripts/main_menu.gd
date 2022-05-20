extends Control

func ready():
	$VBoxContainer/start.grab_focus()

func _on_start_pressed():
	get_tree().change_scene("res://scenes/game.tscn")


func _on_options_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
