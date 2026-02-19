extends Area2D

@export var jump_force = -1600

func _on_body_entered(body):
	# If the object is a CharacterBody2D (like a player), launch them
	if body is CharacterBody2D:
		body.velocity.y = jump_force
