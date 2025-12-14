extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

var jumped_from_floor = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			jumped_from_floor = true
		if not is_on_floor() and jumped_from_floor:
			velocity.y = JUMP_VELOCITY
			jumped_from_floor = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if direction == -1:
			$Sprite.flip_h = false
		else:
			$Sprite.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
