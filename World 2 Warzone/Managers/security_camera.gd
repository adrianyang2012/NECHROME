extends Node2D
@onready var game: Node2D = $".."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var mode = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation += delta * mode * 0.5
	if rotation > 2.7:
		mode = -1
	elif rotation < 0.5:
		mode = 1


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if position.x > 50000:
		for i in range(10):
			game.summon2(position.x + randfn(-1000, 0),position.y + 400,20)
	else:
		
		for i in range(5):
			if position.x>-10000:
				if position.x>10000:
					game.summon(position.x+randfn(-300, 300.0),position.y+randfn(100, 200.0),15)
				else:
					game.summon(position.x+randfn(-300, 300.0),position.y+randfn(100, 200.0),10)
			else:
				
				game.summon(position.x+randfn(-300, 300.0),position.y+randfn(100, 200.0),5)
	queue_free()
