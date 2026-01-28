extends Node2D

@onready var timer: Timer = $Timer
@export var damage = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	pass # Replace with function body.




func _on_timer_timeout() -> void:
	queue_free()
func _process(delta: float) -> void:
	if randf()>0.7:
		if randf()>0.9:
			damage = 10
		else:
			damage = 2
	else:
		damage = 1
