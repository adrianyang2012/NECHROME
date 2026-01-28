extends Node2D

@onready var timer: Timer = $Timer

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var sprite_2d_2: Sprite2D = $Sprite2D2
var stage = 0
func start() -> void:
	sprite_2d.visible = true
	stage = 1
var thescale = 0.1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if stage==1:
		
		sprite_2d.position.y-=delta*1000
		sprite_2d_2.position.y-=delta*1000
		if sprite_2d.position.y<-1000:
			stage = 2
			sprite_2d.visible = false
			sprite_2d_2.visible = true
	elif stage==2:
		print(sprite_2d_2.visible)
		thescale+=delta*8
		sprite_2d_2.scale = Vector2(thescale,thescale)
		if thescale>5:
			stage = 0
			timer.start()
			sprite_2d_2.visible = false
		
		


func _on_timer_timeout() -> void:
	sprite_2d.position.y = 0
	sprite_2d_2.position.y = 0
	sprite_2d.visible = true
	sprite_2d_2.scale = Vector2(0.1,0.1)
	thescale = 0.1
	stage = 1
