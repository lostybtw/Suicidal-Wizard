extends RigidBody2D

var touching_ground = false

func _physics_process(delta):
	if Input.is_key_pressed(KEY_D):
		set_linear_velocity(Vector2(100,linear_velocity.y))
	elif Input.is_key_pressed(KEY_A):
		set_linear_velocity(Vector2(-100,linear_velocity.y))
	elif Input.is_key_pressed(KEY_W) && touching_ground:
		apply_impulse(Vector2(),Vector2(0,-100))



func _on_Area2D_body_entered(touched):
	if touched.get_name() == "ground":
		touching_ground = true




func _on_Area2D_body_exited(touched):
	if touched.get_name() == "ground":
		touching_ground = false
