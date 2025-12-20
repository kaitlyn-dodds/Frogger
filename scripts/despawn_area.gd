extends Area2D

func _on_area_entered(area: Area2D) -> void:
	# despawn cars
	if area.is_in_group("cars"):
		print("despawning...")
		area.queue_free()
