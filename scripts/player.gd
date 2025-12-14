extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

var jumped_from_floor = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			jumped_from_floor = true
		if not is_on_floor() and jumped_from_floor:
			velocity.y = JUMP_VELOCITY
			jumped_from_floor = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")

	# Flip the sprite
	if direction < 0:
		$Sprite.flip_h = false
	elif direction > 0:
		$Sprite.flip_h = true

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Play animations
	if is_on_floor():
		if direction == 0:
			$Sprite.play("idle")
		else:
			$Sprite.play("run")
	else:
		$Sprite.play("jump")
		
	move_and_slide()
