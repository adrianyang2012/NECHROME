extends Node2D
@onready var color_rect: ColorRect = $"../Player/Camera2D/ColorRect"
var a = 0
var b = 1
@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2
@onready var timer_3: Timer = $Timer3


@onready var player: CharacterBody2D = $"../Player"
func start():
	color_rect.visible = true
	timer_2.start()
	timer_3.start()
	visible = false
	
func _ready():
	print('yes')

@onready var sprite_2d_2: Sprite2D = $"../Player/Sprite2D2"
@onready var prequel_text: Label = $"../Player/Camera2D/Prequel text"
@onready var health_manager: Node2D = $"../Player/Camera2D/health manager"
@onready var corruption_manager: Node2D = $"../Player/Camera2D/corruption manager"
@onready var color_rect_2: ColorRect = $"../Player/Camera2D/ColorRect2"
func prequel() -> void:
	color_rect_2.visible = true
	print('yes')
	timer_3.start()
func _on_timer_timeout() -> void:
	a+=0.02
	print(a)
	if a>1.0:
		player.position.x = 23
		player.position.y = 59
		color_rect.visible = false
		sprite_2d_2.visible = false
		player.real_game()
		health_manager.visible = true
		corruption_manager.visible = true
		queue_free()
	color_rect.color = Color(0, 0, 0, a)
	

func _on_button_button_down() -> void:
	start()
	pass # Replace with function body.


func _on_timer_2_timeout() -> void:
	timer.start()
	pass # Replace with function body.


func _on_timer_3_timeout() -> void:
	b-=0.02
	color_rect_2.color = Color(0, 0, 0, b)
	if b<0.01:
		color_rect_2.visible = false
