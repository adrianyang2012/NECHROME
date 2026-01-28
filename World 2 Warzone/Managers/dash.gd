extends Node2D


@onready var player: CharacterBody2D = $"../Player"

@onready var inventory_manager: Node2D = $"../Player/Inventory manager"

func _on_area_2d_body_entered(body: Node2D) -> void:
	player.dash()
	inventory_manager.dash_unlock()
	queue_free()
