extends CharacterBody2D


var SPEED = 450.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction1 := Input.get_axis("Move_left", "Move_right")
	var direction2 := Input.get_axis("Move_up", "Move_down")
	if Input.is_action_just_pressed("sprint"):
		SPEED = 900
	elif Input.is_action_just_released("sprint"):
		SPEED = 450
	if direction1:
		velocity.x = direction1 * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction2:
		velocity.y = direction2 * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
