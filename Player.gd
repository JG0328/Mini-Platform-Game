extends KinematicBody2D

const GRAVITY = 35
const MOVE_SPEED = 200
const JUMP_FORCE = -400

var motion = Vector2()

func _physics_process(delta):
	motion.y += 10
	
	if Input.is_action_pressed("ui_right"):
		motion.x = MOVE_SPEED
		$Sprite.flip_h = false
		$Sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -MOVE_SPEED
		$Sprite.flip_h = true
		$Sprite.play("run")
	else:
		$Sprite.play("idle")
		motion.x = 0
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_FORCE
	else:
		$Sprite.play("jump")
	
	motion = move_and_slide(motion, Vector2.UP)
