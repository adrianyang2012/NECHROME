extends Area2D

@onready var boss: Area2D = $"../Boss"
@onready var health_manager: Node2D = $"../Player/Camera2D/health manager"
var started = 0
@onready var label: Label = $Label
@onready var label_2: Label = $Label2

@onready var label_3: Label = $Label3


@onready var player: CharacterBody2D = $"../Player"
@onready var timer: Timer = $Timer
var num = 0
func _on_body_entered(body: Node2D) -> void:
	if not started:
		label.text = "Even if you defeat me, you will become corrupted as I have. You will become an overlord like me."
		started =1
		
		player.cutscene()
		health_manager.boss()
		timer.start()


func _on_timer_timeout() -> void:
	num+=1
	if num==2:
		label_2.text = 'I thought you were the motherbrain?'
	if num==3:
		label_3.text = 'No, I am only the beginning'
	if num<4:
		timer.start()
	if num==4:
		label.text = ""
		label_2.text = ""
		label_3.text = ""
		boss.reached()
	pass # Replace with function body.
