extends Node2D

var car_scene: PackedScene = preload("res://scenes/characters/car.tscn")

@onready var cars: Node2D = $"../../Level/Cars"
@onready var pos_marker: Marker2D = $Marker2D

func spawn_car() -> void:
	var car: Area2D = car_scene.instantiate()
	car.position = pos_marker.global_position
	
	# add to cars node
	cars.add_child(car)
	
	# connection
	car.connect("body_entered", go_to_title)

func _on_timer_timeout() -> void:
	spawn_car()
	
func go_to_title(node: Node2D) -> void:
	#if node.is_in_group("player"):
	print("should go to title")
