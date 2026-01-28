extends Node2D
@onready var health_amount: Label = $"health amount"
@onready var death_screen_time: Timer = $"Death screen time"

@onready var player: CharacterBody2D = $"../.."

@onready var health_manager: Node2D = $"."

@onready var boss_health: Label = $"Boss health"
var max_health = 150
var cur_health = max_health
var cur_touch = 0
var bossfight = 0
var bosshealth = 150
var corruption = 0
func journey():
	max_health = 1500000
	cur_health = 1500000
	ui.journey()
func easy():
	max_health = 550
	cur_health = 550
	ui.easy()
func normal():
	max_health = 350
	cur_health = 350
	ui.normal()
func hard():
	max_health = 150
	cur_health = 150
	ui.hard()

func boss() -> void:
	bossfight = 1
func ouch() -> void:
	cur_touch+=1
func ouch2() -> void:
	cur_touch+=3
func unouch2() -> void:
	cur_touch-=3

@onready var camera_2d: Camera2D = $".."
	
var longheal = 0
@onready var timer: Timer = $Timer
@onready var ui: CanvasLayer = $"../../../UI"

func long_heal() -> void:
	longheal = 1
	timer.start()
func corrupted() -> void:
	corruption_thing = 1
func uncorrupted() -> void:
	corruption_thing = 0
func unouch() -> void:
	cur_touch-=1
func heal() -> void:
	cur_health+=25
	if cur_health>max_health:
		cur_health = max_health
	ui.increase2()
# Called every frame. 'delta' is the elapsed time since the previous frame.
@onready var boss_scene: Area2D = $"../../../Boss"
@onready var real_boss: Node2D = $"../../../Real Boss"
	
func major_ouch()->void:
	cur_health-=50
	ui.decrease2()
var getout = 0
func start_final()->void:
	getout = 1
@onready var collision_shape_2d: CollisionShape2D = $"../../../Area2D/CollisionShape2D"
@onready var button: Button = $"../Start/Button/Button"
var dead = 0
var corruption_thing = 0
func full_heal() -> void:
	cur_health=max_health
	ui.full_heal()
func _process(delta: float) -> void:

	if corruption_thing:
		if randf()>0.98:
			ui.decrease()
			cur_health-=1
	cur_health+=longheal
	for i in range(longheal):
		ui.increase()
	if cur_health>max_health:
		cur_health = max_health
	if cur_touch>2:
		cur_health-=2
		for i in range(2):
			ui.decrease()
	else:
		cur_health-=cur_touch
		for i in range(cur_touch):
			ui.decrease()
	if cur_health<1  and not dead:
		dead = 1
		lose.visible = true
		
		death_screen_time.start()
	health_amount.text = "Health: "+str(int((float(cur_health)/max_health)*100))
	if bossfight==1:
		boss_health.text = "Health: "+str(int((float(bosshealth)/150)*100))
	else:
		boss_health.text = ""


func _on_timer_timeout() -> void:
	longheal = 0
func restart() -> void:
	timer.start()

@onready var lose: Sprite2D = $"../Lose"

func _on_death_screen_time_timeout() -> void:
	print('time out')
	get_tree().change_scene_to_file("res://games/startpanel.tscn")
	pass # Replace with function body.
