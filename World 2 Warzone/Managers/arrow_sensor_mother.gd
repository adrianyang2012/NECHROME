extends Area2D

@onready var motherbrain: Node2D = $".."
func _ready() -> void:
	print(body_entered.get_connections(),'apple')
