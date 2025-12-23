extends Node2D

var car_scene: PackedScene = preload("res://scenes/characters/car.tscn")

@onready var timer: Timer = $Timer
@onready var cars: Node2D = $"../../Level/Cars"
@onready var pos_marker: Marker2D = $Marker2D

@export var carSpeed: int = 100
@export var spawnFrequency: float = 1.0
@export var spawnJitter: float = 0.0

var rng := RandomNumberGenerator.new()

func _ready() -> void:
	# set timer wait time
	timer.wait_time = spawnFrequency
	
	# only call once in _ready
	rng.randomize()
	

func spawn_car() -> void:
	var car: Area2D = car_scene.instantiate()
	car.position = pos_marker.global_position
	
	# set car speed
	car.set_speed(carSpeed)
	
	# add to cars node
	cars.add_child(car)
	
	# connection
	car.connect("body_entered", _go_to_title)

	
func _go_to_title(_node: Node2D) -> void:
	Global.go_to_title()
	
	
func _on_timer_timeout() -> void:
	spawn_car()
	
	# add random jitter
	timer.wait_time = _get_next_offset()	


func _get_next_offset() -> float:
	return max(.3, spawnFrequency + rng.randf_range(-spawnJitter, spawnJitter))
	
	
