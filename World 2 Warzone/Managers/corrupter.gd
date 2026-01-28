extends Area2D


@onready var corruption_manager: Node2D = $"../Player/Camera2D/corruption manager"
@onready var openable_door: Node2D = $"../Openable door"

@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2
@onready var label: Label = $Label
@onready var label_2: Label = $Label2

func _on_body_entered(body: Node2D) -> void:
	corruption_manager.explode()
	
func enough()-> void:
	label_2.visible = true
	timer.start()
	if is_instance_valid(openable_door):
		openable_door.queue_free()
func notenough() -> void:
	label.visible = true
	timer_2.start()


func _on_timer_timeout() -> void:
	queue_free()


func _on_timer_2_timeout() -> void:
	label.visible = false
