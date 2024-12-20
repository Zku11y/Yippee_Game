extends CharacterBody2D
@onready var glow: AnimationPlayer = $Glow
@onready var sprite: Sprite2D = $Sprite2D
@onready var light_yippee: PointLight2D = $PointLight2D
@onready var animation: AnimationPlayer = $AnimationPlayer
var SPEED = 450.0
const JUMP_VELOCITY = -400.0
var orb_count : int = 0
var light_intensity
var sprint = false

func _physics_process(_delta: float) -> void:
	var direction1 := Input.get_axis("Move_left", "Move_right")
	var direction2 := Input.get_axis("Move_up", "Move_down")
	if Input.is_action_just_pressed("sprint"):
		SPEED = 900
		sprint = true
		glow.play("Glow_up")
	elif Input.is_action_just_released("sprint"):
		SPEED = 450
		sprint = false
		glow.play("Glow_down")
	if direction1:
		velocity.x = direction1 * SPEED
		animation.play("go_left_and_right")
		if velocity.x > 0:
			sprite.flip_h = false
		elif velocity.x < 0:
			sprite.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction2:
		velocity.y = direction2 * SPEED
		if velocity.y < 0:
			animation.play("go_up")
		elif velocity.y > 0:
			animation.play("go_down")
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if !direction1 and !direction2:
		animation.play("idle")
	print("orbs = ", orb_count)
	move_and_slide()

#func light_manage(_delta) -> void:
	
