extends CharacterBody2D

@onready var player_sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 3000.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Get the input direction 
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	# set character animation 
	if direction == Vector2.ZERO:
		player_sprite.play("idle")
	if direction == Vector2.LEFT:
		player_sprite.play("move_left")
	if direction == Vector2.RIGHT:
		player_sprite.play("move_right")
	if direction == Vector2.DOWN:
		player_sprite.play("move_down")
	if direction == Vector2.UP:
		player_sprite.play("move_up")
	
	# set velocity
	velocity = direction * SPEED * delta
	
	move_and_slide()
