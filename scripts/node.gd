extends Node2D

var playerpos = Vector2(0,0)

signal died

func _ready():
	playerpos = $player.position
	$invis.set_collision_layer_bit(1,false)
	$invis.set_collision_layer_bit(2,false)
	$invis.set_collision_layer_bit(3,false)

func _on_death_platform_body_entered(body):
	#get_tree().change_scene("res://scenes/death.tscn")
	if body.get_name() == "player":
		fix_platfrom()
		emit_signal("died")

func fix_platfrom():
	$player.position = playerpos
	$invis.visible = !$invis.visible
	#$invis2.visible = true
	$invis.set_collision_layer_bit(1,!$invis.get_collision_layer_bit(1))
	$invis.set_collision_layer_bit(2,!$invis.get_collision_layer_bit(2))
	$invis.set_collision_layer_bit(3,!$invis.get_collision_layer_bit(3))

