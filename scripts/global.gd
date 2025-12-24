extends Node

var score: int = 0
var player_can_move: bool = false
var player_dead: bool = false

func restart() -> void:
	player_dead = false
	player_can_move = false
	
	call_deferred("change_scene", "res://scenes/game.tscn")
	
func go_to_title() -> void:
	call_deferred("change_scene", "res://scenes/title.tscn")
	
func change_scene(scene: String) -> void:
	get_tree().change_scene_to_file(scene)
	
func hit_player(_node: Node2D) -> void:
	if player_dead:
		# he's already dead jim
		return
	
	# stop player movement
	player_can_move = false
	
	# play death animation
	player_dead = true
	
	# wait for 1 second
	await get_tree().create_timer(1.0).timeout
	
	# change scene
	go_to_title()
	 
