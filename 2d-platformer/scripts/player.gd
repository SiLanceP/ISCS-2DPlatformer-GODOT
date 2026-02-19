extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 300.0
const JUMP_VELOCITY = -900.0
const max_jumps = 2
var jump_count = 0


func _physics_process(delta: float) -> void:
	
	# animations
	if is_on_floor():
		if velocity.x > 1 or velocity.x < -1:
			animated_sprite_2d.play("run")
		else:
			animated_sprite_2d.play("idle")

	else:
		velocity += get_gravity() * delta
		
		if velocity.y < 0:
			animated_sprite_2d.play("jump")
		elif velocity.y > 0:
			animated_sprite_2d.play("fall")
		

	# Handle jump.
	if is_on_floor():
		jump_count = 0
	
	if Input.is_action_just_pressed("jump"):
		if jump_count < max_jumps:
			velocity.y = JUMP_VELOCITY
			jump_count += 1
			animated_sprite_2d.play("jump") #replays the jump animation mid-air

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if direction == 1.0:
		animated_sprite_2d.flip_h = false
	elif direction == -1.0:
		animated_sprite_2d.flip_h = true
	
	#One-way platforms
	if is_on_floor() and Input.is_action_just_pressed("down"):
		position.y += 1.0


func _on_jumpie_body_entered(body: Node2D) -> void:
		pass
