extends Node2D

@onready var inventory_manager: Node2D = $"../Player/Inventory manager"
@onready var player: CharacterBody2D = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
var dir = 1
var counter =0 
func _process(delta: float) -> void:
	position.y+=dir*0.5
	counter+=delta*100
	if counter>60:
		dir = -dir
		counter = 0
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	inventory_manager.add_supplies()
	
	player.open_parachute()
	queue_free()
