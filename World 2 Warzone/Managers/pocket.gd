extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
@onready var label: Label = $Label
@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	label.visible = true
	timer.start()


func _on_timer_timeout() -> void:
	label.visible = false
	pass # Replace with function body.
