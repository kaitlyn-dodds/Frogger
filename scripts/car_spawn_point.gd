extends Node2D

var car_scene: PackedScene = preload("res://scenes/car.tscn")

@onready var cars: Node = $"../../Cars"
@onready var pos_marker: Marker2D = $Marker2D

func spawn_car() -> void:
	var car: Area2D = car_scene.instantiate()
	car.position = pos_marker.global_position
	
	cars.add_child(car)

func _on_timer_timeout() -> void:
	spawn_car()
