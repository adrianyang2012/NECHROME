extends Node2D
@onready var game: Node2D = $"../../.."

@onready var corruption_amount: Label = $"corruption amount"
var corruption = 0
@onready var health_manager: Node2D = $"../health manager"
@onready var corrupter: Area2D = $"../../../corrupter"
@onready var timer: Timer = $Timer
@onready var color_rect: ColorRect = $"../ColorRect"
@onready var timer_2: Timer = $Timer2
@onready var area_2d_2: Area2D = $"../../../Area2D2"
@onready var timer_3: Timer = $Timer3

@onready var player: CharacterBody2D = $"../.."
func explode() -> void:
	if corruption>59:
		corrupter.enough()
		corruption+=40
	else:
		corrupter.notenough()
		
func explode2()->void:
	corruption+=400
func upgrade() -> void:
	corruption+=1
func decrease() -> void:
	corruption-=1
var stop = 0
var stop2 = 0
var started_decreasing= 0
func _process(delta: float) -> void:
	if corruption>5:
		visible = true
	else:
		visible = false
	if corruption>15 and not stop:
		player.speed_upgrade()
		stop = 1
	if corruption>25 and not stop2:
		player.speed_upgrade()
		stop2 = 1
	corruption_amount.text = "corruption: "+str(corruption)
	if not started_decreasing and corruption>500:
		health_manager.corrupted()
func zero() -> void:
	corruption = 0
var started = 0 
func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if corruption>=100 and not started:
		started = 1
		timer_2.start()
		color_rect.visible = true
		player.enterdoor()
		player.cutscene()
		game.hide_bow()


func _on_timer_timeout() -> void:
	area_2d_2.queue_free()
	player.position.x = 57000
	player.position.y = -4000
	game.show_bow()
	player.exitdoor()
	timer_3.start()
	#get_tree().reload_current_scene()#change this to switch scene to world 3 after kartikey finishes
var alpha = 0

func _on_timer_2_timeout() -> void:
	if alpha<1.00:
		alpha+=0.02
		color_rect.color = Color(0,0,0,alpha)
		timer_2.start()
		
	else:
		timer.start()


func _on_timer_3_timeout() -> void:
	if alpha>0.0:
		alpha-=0.05
		color_rect.color = Color(0,0,0,alpha)
		timer_3.start()
	else:
		player.stop()
		

		
