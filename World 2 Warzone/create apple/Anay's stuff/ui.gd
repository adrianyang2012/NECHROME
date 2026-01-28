extends CanvasLayer

@onready var heart: TextureRect = $Hearts/Heart

@onready var heart_2: TextureRect = $Hearts/Heart2

@onready var heart_3: TextureRect = $Hearts/Heart3
@onready var heart_4: TextureRect = $Hearts/Heart4
@onready var heart_5: TextureRect = $Hearts/Heart5
@onready var heart_6: TextureRect = $Hearts/Heart6

@onready var heart_7: TextureRect = $Hearts/Heart7
@onready var heart_8: TextureRect = $Hearts/Heart8

@onready var heart_9: TextureRect = $Hearts/Heart9
@onready var timer: Timer = $Timer

@onready var heart_10: TextureRect = $Hearts/Heart10
var health = 150
var max_health = 150
var started = 0
func easy():
	print('hi')
	max_health = 550
	health = 550
func hard():
	max_health = 150
	health = 150
func normal():
	max_health = 350
	health = 350
func journey():
	max_health = 1500000
	health = 1500000
func increase():
	health+=1
	if health>max_health:
		health = max_health
	visible = 1
	timer.start()
func decrease():
	health-=1
	if health>max_health:
		health = max_health
	visible = 1
	timer.start()
func decrease2():
	health-=50
	if health>max_health:
		health = max_health
	visible = 1
	timer.start()
func increase2():
	health+=25
	if health>max_health:
		health = max_health
	visible = 1
	timer.start()
func _ready() -> void:
	started = 1
func full_heal() -> void:
	health = max_health
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if health>(0*max_health):
		heart.show()
	else:
		heart.hide()
	if health>(0.1*max_health):
		heart_2.show()
	else:
		heart_2.hide()
	if health>(0.2*max_health):
		heart_3.show()
	else:
		heart_3.hide()
	if health>(0.3*max_health):
		heart_4.show()
	else:
		heart_4.hide()
	if health>(0.4*max_health):
		heart_5.show()
	else:
		heart_5.hide()
	if health>(0.5*max_health):
		heart_6.show()
	else:
		heart_6.hide()
	if health>(0.6*max_health):
		heart_7.show()
	else:
		heart_7.hide()
	if health>(0.7*max_health):
		heart_8.show()
	else:
		heart_8.hide()
	if health>(0.8*max_health):
		heart_9.show()
	else:
		heart_9.hide()
	if health>(0.9*max_health):
		heart_10.show()
	else:
		heart_10.hide()


func _on_timer_timeout() -> void:
	visible = 0
	pass # Replace with function body.
