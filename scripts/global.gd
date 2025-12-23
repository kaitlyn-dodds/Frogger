extends Node

var score: int = 0

func restart() -> void:
	call_deferred("change_scene", "res://scenes/game.tscn")
	
func go_to_title() -> void:
	call_deferred("change_scene", "res://scenes/title.tscn")
	
func change_scene(scene: String) -> void:
	get_tree().change_scene_to_file(scene)
