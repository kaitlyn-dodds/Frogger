extends Node2D

@onready var cars: Node = $Cars

var car_scene: PackedScene = preload("res://scenes/car.tscn")

func _on_car_timer_timeout() -> void:
	var car = car_scene.instantiate()
	
	$Cars.add_child(car)
