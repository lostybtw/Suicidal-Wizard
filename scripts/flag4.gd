extends Sprite

func _on_Area2D_body_entered(body):
	if body.get_name() == "player":
		get_tree().change_scene("res://scenes/Level 2.tscn")
