extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@onready var animated_sprite_2d: AnimatedSprite2D = $".."
@onready var player: CharacterBody2D = $"../.."
@onready var health_manager: Node2D = $"../../Camera2D/health manager"
@onready var ui: CanvasLayer = $"../../../UI"
func start() -> void:
	animated_sprite_2d.visible = false
	print('hi')
	

func _on_pressed() -> void:
	if animated_sprite_2d.frame ==1:
		animated_sprite_2d.frame = 0
		ui.easy()
		health_manager.easy()
		player.easy()
		
	else:
		animated_sprite_2d.frame = 1
		ui.hard()
		health_manager.hard()
		player.hard()
