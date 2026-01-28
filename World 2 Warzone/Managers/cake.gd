extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
@onready var player: CharacterBody2D = $"../../Player"
@onready var inventory_manager: Node2D = $"../../Player/Inventory manager"
@onready var super_jump: Node2D = $".."

func _on_body_entered(body: Node2D) -> void:
	inventory_manager.super_jump()
	player.super_jump()
	super_jump.queue_free()
	pass # Replace with function body.
