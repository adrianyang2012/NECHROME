extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
@onready var player: CharacterBody2D = $".."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func stay() -> void:
	zoom = Vector2(0.2,0.2)
	
	
func stop() -> void:
	zoom = Vector2(0.3,0.3) 
	global_position = player.global_position
