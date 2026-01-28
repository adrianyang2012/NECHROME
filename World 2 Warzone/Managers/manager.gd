extends Node2D


@onready var scientist_npc: Node2D = $"../../../Area2D/Scientist NPC"
@onready var timer: Timer = $Timer
var a = 0
func change():
	visible = true
	timer.start()
	




func _on_timer_timeout() -> void:
	position.y-=3
	a+=1
	if a<3000:
		timer.start()
