extends Area2D


@onready var npc: Area2D = $"../NPC"

func _on_body_entered(body: Node2D) -> void:
	print('yes')
	npc.update()
	queue_free()
	pass # Replace with function body.
