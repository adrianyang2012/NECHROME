extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var direction =1
var dino_health = 25;
@onready var right:  RayCast2D = $right
@onready var left: RayCast2D = $left
@onready var down: RayCast2D = $down

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var corruption_manager: Node2D = $"../Player/Camera2D/corruption manager"


func _process(delta) -> void:
	position.x+=delta*800*direction
	if dino_health<1:
		corruption_manager.upgrade()
		queue_free()
	if right.is_colliding():
		direction = -1
	if left.is_colliding():
		direction = 1
	if not down.is_colliding():
		
		direction = -direction
		
		position.x+=delta*1600*direction
	if direction == 1:
		sprite_2d.flip_h = true
	else:
		sprite_2d.flip_h = false
	
@onready var health_manager: Node2D = $"../Player/Camera2D/health manager"


func _on_body_entered(body: Node2D) -> void:
	print('yes')
	health_manager.ouch()



func _on_body_exited(body: Node2D) -> void:
	health_manager.unouch()
	pass # Replace with function body.

func ouch() -> void:
	print('yesss')
	dino_health-=1
