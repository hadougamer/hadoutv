extends KinematicBody2D

const UP 			= Vector2(0,-1)
const GRAVITY 		= 20
const SPEED 		= 200
const JUMP_HEIGHT 	= -650

var motion = Vector2()

func _ready():
	$Sprite.flip_h = true

func _physics_process(delta):
    motion.y += GRAVITY

    if Input.is_action_pressed("ui_left"):
        $Sprite.flip_h = false
        $Sprite.play('walking')
        motion.x = -SPEED
    elif Input.is_action_pressed("ui_right"):
        $Sprite.flip_h = true
        $Sprite.play('walking')
        motion.x = SPEED
    else:
        $Sprite.play('idle')
        motion.x = 0

    if is_on_floor():
        if Input.is_action_pressed("ui_jump"):
            motion.y = JUMP_HEIGHT
    else:
        $Sprite.play('jump')

    motion = move_and_slide(motion, UP)