extends Node2D

var trend = 0
var trend2 = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = -18881
	position.y = -1549
	timer.start()

@onready var timer: Timer = $Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	trend+=((randf()-0.5)*150*delta)
	trend2+=((randf()-0.5)*150*delta)
	position.x+=trend
	position.y+=trend2


func _on_timer_timeout() -> void:
	queue_free()
