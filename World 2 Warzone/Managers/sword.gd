extends Node2D

@onready var timer: Timer = $Timer
@onready var sword_killer: Node2D = $"SwordKiller"

@onready var area_2d: Area2D = $Area2D
@onready var sword_9: Sprite2D = $Area2D/Sword9
var going_on = 0
# Called when the node enters the scene tree for the first time.

@onready var player: CharacterBody2D = $"../Player"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	position.x = player.position.x+player.rotation*1000*150
	position.y = player.position.y+10
	if Input.is_action_just_pressed("attack") and going_on==0:
		var scene = load("res://Managers/sword_killer.tscn")

		var instance = scene.instantiate()
		add_child(instance)
		instance.position = sword_9.position
		going_on = 1
		if player.rotation>0:
			sword_9.rotation = 0.25
		else:
			sword_9.rotation = -1.5
		area_2d.monitorable = true
		timer.start()
		
func bow() -> void:
	queue_free()


func _on_timer_timeout() -> void:
	sword_9.rotation =-0.7120943069458
	area_2d.monitorable = false
	going_on = 0
	
