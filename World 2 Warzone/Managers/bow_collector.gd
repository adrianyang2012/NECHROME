extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
@onready var game: Node2D = $"../.."
@onready var inventory_manager: Node2D = $"../../Player/Inventory manager"
@onready var sword: Node2D = $"../../Sword"

var dir =1
var counter = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y+=dir*0.5
	counter+=delta*100
	if counter>60:
		dir = -dir
		counter = 0
		
	
	


func _on_body_entered(body: Node2D) -> void:
	game.create()
	inventory_manager.bow_unlock()
	if is_instance_valid(sword):
		sword.queue_free()
	queue_free()
