extends Node

var total_banana : int = 0

func banana_collected(value: int):
	total_banana += value
	EventController.emit_signal("banana_collected", total_banana)
	
