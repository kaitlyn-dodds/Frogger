extends Area2D

@onready var sprite: Sprite2D = $Sprite2D

var direction = Vector2.LEFT
var speed = 200
var variations  = [
	preload("res://assets/graphics/cars/green.png"),
	preload("res://assets/graphics/cars/red.png"),
	preload("res://assets/graphics/cars/yellow.png")
]

func _ready() -> void:
	# set sprite
	sprite.texture = variations.pick_random()
	
	if position.x < 0:  # car direction should be flipped
		direction.x = 1
		sprite.flip_h = true

func _process(delta: float) -> void:
	position += (direction * speed) * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	# no longer visible, despawn
	queue_free()
	
func set_speed(value: int) -> void:
	speed = value
