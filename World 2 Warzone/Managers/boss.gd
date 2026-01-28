extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
@onready var health_manager: Node2D = $"../Player/Camera2D/health manager"

@onready var corruption_manager: Node2D = $"../Player/Camera2D/corruption manager"
# Called every frame. 'delta' is the elapsed time since the previous frame.
@onready var player: CharacterBody2D = $"../Player"

var startbattle = 0
var knocked_back = false
func reached() -> void:
	startbattle = 1
func die()->void:
	corruption_manager.explode()
	
	queue_free()
func _process(delta: float) -> void:
	var knocked_back = false
	if startbattle:
			
			
		if player.position.x>position.x:
			position.x+=delta*(1000)
		else:
			position.x-=delta*(1000)
		if player.position.y>position.y:
			position.y+=delta*(1000)
		else:
			position.y-=delta*(1000)
		


func _on_body_entered(body: Node2D) -> void:
	knocked_back = true
	health_manager.ouch()
	health_manager.ouch()
	health_manager.ouch()


func _on_arrow_sensor_area_entered(area: Area2D) -> void:
	health_manager.bossouch()




func _on_body_exited(body: Node2D) -> void:
	health_manager.unouch()
	health_manager.unouch()
	health_manager.unouch()
