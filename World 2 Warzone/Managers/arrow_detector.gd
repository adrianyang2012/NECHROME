extends Area2D

@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.

@onready var timer: Timer = $Timer

@onready var enemy: Area2D = $".."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	enemy.ouch()
	timer.start()
	label.text = "1"


func _on_timer_timeout() -> void:
	label.text =""
