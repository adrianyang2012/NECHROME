extends Node2D
@onready var game: Node2D = $".."

@onready var label: Label = $Label
@onready var player: CharacterBody2D = $"../Player"
@onready var health_manager: Node2D = $"../Player/Camera2D/health manager"
@onready var corruption_manager: Node2D = $"../Player/Camera2D/corruption manager"
var health = 500
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = 61364
	position.y = 2686

func ouch() -> void:
	health-=1
# Called every frame. 'delta' is the elapsed time since the previous frame.
var exploded = 0
var xspeed = 1200
func _process(delta: float) -> void:
	if health<100:
		xspeed=100
	elif health<200:
		xspeed=200
	elif health<300:
		xspeed = 500
	elif health<400:
		xspeed =800
	
	if health<1 and not exploded:
		exploded = 1
		corruption_manager.explode2()
		game.guardian()
		queue_free()
	label.text = "health: " + str(health)
	if player.position.x>position.x:
		position.x+=delta*(xspeed)
	else:
		position.x-=delta*(xspeed)
	if player.position.y>position.y:
		position.y+=delta*(350)
	else:
		position.y-=delta*(350)


func _on_area_2d_body_entered(body: Node2D) -> void:
	health_manager.ouch()
	health_manager.ouch()


func _on_area_2d_body_exited(body: Node2D) -> void:
	health_manager.unouch()
	health_manager.unouch()



func _on_arrow_sensor_2_area_entered(area: Area2D) -> void:
	health-=1
