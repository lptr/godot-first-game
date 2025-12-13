extends Node2D

const SPEED = 60

var direction = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $RayCastRight.is_colliding():
		direction = -1
	if $RayCastLeft.is_colliding():
		direction = 1
	position.x += direction * SPEED * delta
