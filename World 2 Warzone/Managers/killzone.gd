extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print('ready')
	pass # Replace with function body.

@onready var timer: Timer = $Timer
@onready var lose: Sprite2D = $"../Player/Camera2D/Lose"

@onready var button: Button = $"../Player/Camera2D/Start/Button/Button"


func _on_body_entered(body: Node2D) -> void:
	lose.visible = true
	timer.start()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://games/startpanel.tscn")

	pass # Replace with function body.
