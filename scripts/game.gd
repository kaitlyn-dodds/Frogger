extends Node2D

@onready var score_label: Label = $CanvasLayer/ScoreLabel
@onready var score_timer: Timer = $Timers/ScoreTimer
@onready var countdown_label: Label = $CanvasLayer/CountdownLabel
@onready var ready_set_timer: Timer = $Timers/ReadySetTimer

var score: int = 0

func _ready() -> void:
	score = 0
	Global.player_can_move = false
	

func _process(_delta: float) -> void:
	# update countdown timer
	if is_instance_valid(countdown_label):
		var time_left: int = int(ready_set_timer.time_left)
		if time_left == 0:
			countdown_label.text = "Go!"
		else:	
			countdown_label.text = str(time_left)
	
	
func _on_score_timer_timeout() -> void:
	score += 1
	score_label.text = str(score)
	

func _on_finish_area_body_entered(_body: Node2D) -> void:
	Global.finish_level(score)
	

func _on_ready_set_timer_timeout() -> void:
	# remove countdown label from view
	countdown_label.queue_free()
	
	# player can move
	Global.player_can_move = true
	
	# start game timer
	score_timer.start()
