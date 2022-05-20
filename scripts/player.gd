extends KinematicBody2D

var motion = Vector2(0,0)
export (int) var gravity = 400
export (int) var speed = 5
export (int) var jump_speed = 2
var suicide = false
var tp_player = false

func _physics_process(delta: float) -> void:
	
	#if motion.x != 0 and is_on_floor():
	#	$AnimationPlayer.play("Move")
	if Input.is_key_pressed(KEY_D):
		motion.x +=speed
		#sprite.set_flip_h(false)
	elif Input.is_key_pressed(KEY_A):
		motion.x -=speed
		#sprite.set_flip_h(true)
	else:
		#motion.x = 0
		motion.x = lerp(motion.x,0,0.1)
	#	$AnimationPlayer.play("Idle")
	if is_on_floor():
		if Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_SPACE):
			motion.y += -(jump_speed * 100)
	motion.y += gravity * delta
	if tp_player && is_on_floor():
		motion.y = 0
	motion = move_and_slide(motion,Vector2.UP)
	
	if suicide:
		var node = get_parent()
		var obj = node.get_child(4)
		var sprite = get_child(0)
		obj.scale = Vector2(0,0)
		#obj.get_child(1).disable()
		tp_player = true
		sprite.position.x = 400
		sprite.position.y = -300 
		
		


func _on_death_platform_body_entered(body):
	if body.get_name() == "player":
		suicide = true 
