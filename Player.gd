extends KinematicBody2D

const GRAVITY = 35
const ACCELERATION = 50
const MAX_SPEED = 200
const JUMP_FORCE = -400

var motion = Vector2()

func _physics_process(delta):
	motion.y += 10
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("run")
	else:
		$Sprite.play("idle")
		friction = true
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_FORCE
		if friction:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0:
			$Sprite.play("jump")
		else:
			$Sprite.play("fall")
		
		if friction:
			motion.x = lerp(motion.x, 0, 0.05)
	
	motion = move_and_slide(motion, Vector2.UP)
