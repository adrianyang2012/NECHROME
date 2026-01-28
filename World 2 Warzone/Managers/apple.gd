extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



@onready var health_manager: Node2D = $"../Player/Camera2D/health manager"

@onready var inventory_manager: Node2D = $"../Player/Inventory manager"

func _on_body_entered(body: Node2D) -> void:
	inventory_manager.apple_gain()
	queue_free()
var dir = 1
var counter =0 
func _process(delta: float) -> void:
	position.y+=dir*0.25
	counter+=delta*100
	if counter>60:
		dir = -dir
		counter = 0
		
