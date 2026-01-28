extends Node2D
@onready var detector: Area2D = $detector
@onready var label: Label = $Label
@onready var timer: Timer = $Timer
@onready var label_2: Label = $Label2
@onready var game: Node2D = $".."
@onready var dialogue_one: Area2D = $"../dialogue one"
@onready var player: CharacterBody2D = $"../Player"
@onready var dialgoue_three: Area2D = $"../dialgoue three"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text =  ""
	label_2.text = ""

var follow_player = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("skip") and cur_mode<11:
		label.text = ""
		label_2.text = ""
		follow_player = 1
		player.stop()
		cur_mode = 6
		mode = 6
		print('yes')
	if follow_player:
		position.x = player.position.x-60
		position.y = player.position.y-150
var mode = 0

func _on_detector_body_entered(body: Node2D) -> void:
	if mode==0:
		print('player')
		player.cutscene()
		detector.set_deferred("monitoring",false)
		label.text = "Hello sir, nice to meet you."
		timer.wait_time = 2
		timer.start()
		pass # Replace with function body.
@onready var dialogue_two: Area2D = $"../dialogue two"

var cur_mode = 0
func _on_timer_timeout() -> void:
	cur_mode = mode
	if cur_mode==0:
		label_2.text = "Who are you?"
		timer.wait_time = 1.2
		mode+=1
		timer.start()
	elif cur_mode ==1:
		label.text = "I am your doctor and I found you in a forest barely alive, saved by a force"
		timer.wait_time = 4
		mode+=1
		timer.start()
	elif cur_mode==2:
		label_2.text = "Wait, i have seen you before"
		timer.wait_time = 2
		mode+=1
		timer.start()
	elif cur_mode==3:
		label.text = ""
		label_2.text = "You were the guy who evacuated everyone from those crabs!"
		timer.wait_time = 4
		mode+=1
		timer.start()
	elif cur_mode==4:
		label.text = "I can help you find out everything about those crabs if you want"
		label_2.text = ""
		timer.wait_time = 2
		mode+=1
		timer.start()
	elif cur_mode==5:
		label_2.text = "Ok, you can help me"
		
		timer.wait_time = 2
		
		mode+=1
		timer.start()
	elif cur_mode==6:
		label.text = ""
		label_2.text = ""
		follow_player = 1
		player.stop()
	elif cur_mode==7:
		game.sword()
		label.text = ""
	elif cur_mode==8:
		label_2.text = "why?"
		mode+=1
		timer.wait_time = 2
		timer.start()
	elif cur_mode==9:
		label.text = "You will earn double jump after 15 corruption, and triple jump after 25 corruption, and you will unlock the door at 100, but one man has misused it in the past."
		timer.wait_time = 15
		mode+=1
		timer.start()
	elif cur_mode == 10:
		label.text = ""
		label_2.text = ""
	elif cur_mode==11:
		queue_free()

func _on_dialogue_one_body_entered(body: Node2D) -> void:
	dialogue_one.queue_free()
	mode+=1
	timer.wait_time=4
	timer.start()
	label.text = "Here, take this weapon you will need it for battle"
	
	


func _on_dialogue_two_body_entered(body: Node2D) -> void:
	mode+=1
	dialogue_two.queue_free()
	label.text = "You must use the corruption to become stronger. However, be careful with it"
	timer.wait_time=4
	timer.start()
	pass # Replace with function body.


func _on_dialgoue_three_body_entered(body: Node2D) -> void:
	mode+=1
	dialgoue_three.queue_free()
	label.text = "It is for your own good that i carry on. I will be at the village if you need help, but beware all the food and backpacks you collected were from fallen heroes who tried to do the same thing as you."
	timer.wait_time=6
	timer.start()
