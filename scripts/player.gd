extends KinematicBody2D

var motion = Vector2(0,0)
export (int) var gravity = 400
export (int) var speed = 5
export (float) var jump_speed = 2.5

func _physics_process(delta: float) -> void:
	
	#if motion.x != 0 and is_on_floor():
	#	$AnimationPlayer.play("Move")
	if motion == Vector2(0,0):
		$AnimatedSprite.play("idle",true)
	else:
		$AnimatedSprite.play("idle",false)
	
	if Input.is_key_pressed(KEY_SHIFT):
		scale = Vector2(0.5,0.5)
	else:
		scale = Vector2(1,1)
	
	if Input.is_key_pressed(KEY_D):
		if is_on_floor():
			motion.x +=speed
		#sprite.set_flip_h(false)
	elif Input.is_key_pressed(KEY_A):
		if is_on_floor():
			motion.x -=speed
		#sprite.set_flip_h(true)
	else:
		#motion.x = 0
		motion.x = lerp(motion.x,0,0.1)
	#	$AnimationPlayer.play("Idle")
	if is_on_floor():
		if Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_SPACE):
			motion.y += -(jump_speed * 100)
			$hop.play()
	motion.y += gravity * delta
	motion = move_and_slide(motion,Vector2.UP)


func _on_Node2D_died():
	$death.play()
