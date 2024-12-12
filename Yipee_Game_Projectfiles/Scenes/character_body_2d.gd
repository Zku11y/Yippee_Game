extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var DMG_taken
var attack
var HP
@onready var animation: AnimationTree = $AnimationTree
@onready var sprite: Sprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	var Direction1 := Input.get_axis("Move_left", "Move_right")
	var Direction2 := Input.get_axis("Move_up", "Move_down")
	if Input.is_action_just_pressed("takedmg"):
		DMG_taken = 5
	elif Input.is_action_just_released("takedmg"):
		DMG_taken = 0
	if Input.is_action_just_pressed("attack"):
		attack = 5
	elif Input.is_action_just_released("attack"):
		attack = 0
	
	HP = 0
	if Direction1:
		velocity.x = SPEED * Direction1
		if velocity.x > 0:
			sprite.flip_h = false
		elif velocity.x < 0:
			sprite.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Direction2:
		velocity.y = SPEED * Direction2
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()
