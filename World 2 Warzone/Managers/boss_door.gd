extends Node2D
@onready var timer: Timer = $Timer

@onready var static_body_2d: StaticBody2D = $StaticBody2D

func open() -> void:
	timer.start()
	


func _on_timer_timeout() -> void:
	queue_free()
