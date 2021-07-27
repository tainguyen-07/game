extends KinematicBody2D

const UP = Vector2(0,-1)
const MAXFALLSPEED = 500
const MAXSPEED = 210
const GRAVITY = 10
const JUMPFORCE = 300

var motion = Vector2()

func _ready():
	pass

func _physics_process(_delta):
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if Input.is_action_pressed("right"):
		motion.x = -MAXSPEED
		$AnimatedSprite.play("run") 
		$AnimatedSprite.flip_h = true 
	elif Input.is_action_pressed("left"):
		motion.x = MAXSPEED
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
	else:
		motion.x = 0
		$AnimatedSprite.play("idle")
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMPFORCE
	
	motion = move_and_slide(motion,UP)
