extends CharacterBody2D

@onready var player_sprite: AnimatedSprite2D = $AnimatedSprite2D

@export var SPEED = 4000.0
const JUMP_VELOCITY = -400.0

func _set_player_animation(direction: Vector2) -> void:
	if direction == Vector2.ZERO:
		if Global.player_dead:
			player_sprite.play("dead")
		else:
			player_sprite.play("idle")
		return
		
	if direction.x != 0:
		player_sprite.play("move_right" if direction.x > 0 else "move_left")
	else:
		player_sprite.play("move_down" if direction.y > 0 else "move_up")
		

func _handle_player_movement(delta: float) -> void:
	# Get the input direction 
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	# set velocity
	velocity = direction * SPEED * delta
	

func _physics_process(delta: float) -> void:
	if Global.player_can_move:	
		_handle_player_movement(delta)
		
	if Global.player_dead:
		velocity = Vector2.ZERO
		
	# set character animation 
	_set_player_animation(velocity)
	
	move_and_slide()
