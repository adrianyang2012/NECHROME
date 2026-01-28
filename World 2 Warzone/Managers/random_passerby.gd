extends Area2D



@onready var timer: Timer = $"../Timer"
@onready var label: Label = $"../Label"
@onready var label_2: Label = $"../Label2"
var mode = 0

func _on_body_entered(body: Node2D) -> void:
	label.visible = true
	
	timer.start()


func _on_timer_timeout() -> void:
	if mode:
		label_2.visible = false
		label.visible = false
	else:
		mode = 1
		label_2.visible = true
		timer.start()
	
		
