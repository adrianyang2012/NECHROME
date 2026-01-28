extends Node2D
@onready var player: CharacterBody2D = $"../Player"
@onready var sprite_2d: Sprite2D = $ArrowHitbox/Sprite2D
@onready var timer: Timer = $Timer
@export var damage = 1

var dir = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dir = player.rotation
	position.x = player.position.x+dir*1000
	position.y = player.position.y-30
	timer.start()
	
	if round(dir*1000)==1:
		sprite_2d.flip_h = 0
		sprite_2d.flip_v = 0
	else:
		sprite_2d.flip_h = 1
		sprite_2d.flip_v = 1
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x+=delta*1000*1000*dir


func _on_timer_timeout() -> void:
	queue_free()
