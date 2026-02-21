extends Area2D
@onready var sounds = [$speaki, $uaa, $cuayo]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		
		if body.velocity.y > 0:
			
			#Make the player bounce
			body.velocity.y = body.JUMP_VELOCITY 
			
			#play a random sound
			var random_sound = sounds.pick_random()
			random_sound.play()
