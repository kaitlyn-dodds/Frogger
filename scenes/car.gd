extends Area2D

var direction = Vector2.RIGHT
var speed = 200

func _process(delta: float) -> void:
	position += (direction * speed) * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	# no longer visible, despawn
	queue_free()
