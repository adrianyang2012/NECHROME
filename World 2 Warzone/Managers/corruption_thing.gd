extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

@onready var player: CharacterBody2D = $"../Player"
@onready var corruption_manager: Node2D = $"../Player/Camera2D/corruption manager"
@onready var health_manager: Node2D = $"../Player/Camera2D/health manager"


	
@onready var firework_manager: Node2D = $"../Firework manager"
@onready var firework_manager_2: Node2D = $"../Firework manager2"
@onready var firework_manager_3: Node2D = $"../Firework manager3"


func _on_area_2d_area_entered(area: Area2D) -> void:
	player.reset()
	corruption_manager.zero()
	health_manager.uncorrupted()
	firework_manager.start()
	firework_manager_2.start()
	firework_manager_3.start()
