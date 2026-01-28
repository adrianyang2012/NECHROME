extends RigidBody2D
const SPEED = 300.0
const JUMP_VELOCITY = -600.0
@onready var game_manager: Node = $"../Game Manager"
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var lives = 3



func _on_area_2d_body_entered(body):
	if (body.name == "Player"):
		var y_delta = position.y - body.position.y
		print(y_delta)
		if (y_delta > 30):
			body.jump()
			lives -= 1
		if (lives == 0):
			queue_free()
		else:
			game_manager.decrease_health()
