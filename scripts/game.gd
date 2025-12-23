extends Node2D

@onready var label: Label = $CanvasLayer/Label

var score: int = 0

func _ready() -> void:
	score = 0
	
	
func _on_score_timer_timeout() -> void:
	score += 1
	label.text = str(score)
	

func _on_finish_area_body_entered(_body: Node2D) -> void:
	# update score
	if score > Global.score:
		Global.score = score
	
	Global.go_to_title()
	
