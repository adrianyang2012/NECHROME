extends Node2D

@onready var label: Label = $Label
@onready var timer: Timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = 56475.0
	position.y = -3143.0

@onready var health_manager: Node2D = $"../Player/Camera2D/health manager"
@onready var player: CharacterBody2D = $"../Player"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	label.visible = true
	health_manager.full_heal()
	timer.start()


func _on_timer_timeout() -> void:
	player.position.x = 45000
	player.position.y = -10328
	label.visible = false
	
