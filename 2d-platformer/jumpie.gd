extends Area2D

@export var jump_force = -1600

func _on_body_entered(body):
	#launch the player
	if body is CharacterBody2D:
		body.velocity.y = jump_force
