extends Control




func _on_retry_pressed():
	get_tree().change_scene("res://scenes/Level 1.tscn")


func _on_quit_to_menu_pressed():
	get_tree().change_scene("res://scenes/main_menu.tscn")
