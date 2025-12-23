extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D

var direction = Vector2.LEFT
var speed = 200

func _ready() -> void:
	if position.x < 0:  # car direction should be flipped
		direction.x = 1
		sprite_2d.flip_h = true

func _process(delta: float) -> void:
	position += (direction * speed) * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	# no longer visible, despawn
	queue_free()
