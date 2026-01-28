extends Area2D

@onready var inventory_manager: Node2D = $"../Player/Inventory manager"
@onready var health_manager: Node2D = $"../Player/Camera2D/health manager"


func _on_body_entered(body: Node2D) -> void:
	inventory_manager.sugar_gain()
	queue_free()
var dir = 1
var counter =0 
func _process(delta: float) -> void:
	position.y+=dir*0.25
	counter+=delta*100
	if counter>60:
		dir = -dir
		counter = 0
		
