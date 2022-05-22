extends Control

var started = false

func _ready():
	#$VBoxContainer/options.grab_focus()
	var names = ["Suicidal Wizard", "Sad Gandalf :(","Troll Platformer", "Best Game Made in 3 days!!!" , "The Face Of Lonliness", "Bad Game", "Good Game", "Notch's Platformer", "Terraria But Worse!!"]
	randomize()
	name = (names[randi()%names.size()]) 
	print(name)
	$Label.text = name
func _on_start_pressed():
	started = true
	get_tree().change_scene("res://scenes/level_selector.tscn")

func _on_options_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
