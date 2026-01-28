extends Node2D
@onready var player: CharacterBody2D = $"../../Player"
@onready var bow: Sprite2D = $bow


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.rotation>0:
		bow.flip_h = false
		bow.flip_v = false
	else:
		bow.flip_h = true
		bow.flip_v = true
	position.x = player.position.x+player.rotation*1000*80
	position.y = player.position.y-20
	pass
