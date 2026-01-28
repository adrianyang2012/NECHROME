extends Area2D
@onready var shady_guy: Node2D = $".."

@onready var guardian: Node2D = $"../../Guardian"
@onready var player: CharacterBody2D = $"../../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
@onready var timer: Timer = $"../Timer"
var num = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("skip") and num>0:
		shady_guy.queue_free()
@onready var label: Label = $"../Label"
@onready var label_2: Label = $"../Label2"

@onready var label_3: Label = $"../Label3"

func _on_body_entered(body: Node2D) -> void:
	num+=1
	player.cutscene()
	if num==1:
		label.visible = true
		timer.start()
	elif num == 2:
		label_2.visible = true
		timer.start()
	elif num ==3:
		label_3.visible = true
		timer.start()
	else:
		label.visible = false
		label_2.visible = false
		label_3.visible = false
		queue_free()
	

func _on_timer_timeout() -> void:
	num+=1
	if num==1:
		label.visible = true
		timer.start()
	elif num == 2:
		label_2.visible = true
		timer.start()
	elif num ==3:
		label_3.visible = true
		timer.start()
	else:
		label.visible = false
		label_2.visible = false
		label_3.visible = false
		player.stop()
