extends Node2D
@onready var knock_back: Timer = $KnockBack
@onready var display_label: Label = $DisplayLabel
@onready var display_timer: Timer = $DisplayTimer


func ouch(damage) -> void:
	knocked_back = true
	health -= damage
	knock_back.start()
	display_label.text = str(damage)
	display_timer.start()
	
var type = 0
func _ready() -> void:
	if randf()>0.7:
		type = 1
	else:
		type = 0
# Called when the node enters the scene tree for the first time.
var confused = 0
func spawn(x,y) -> void:
	pass # Replace with function body.
@onready var player: CharacterBody2D = $"../Player"

@onready var game: Node2D = $".."


@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var ray_cast_2d_2: RayCast2D = $RayCast2D2
@onready var ray_cast_2d_3: RayCast2D = $RayCast2D3
@onready var ray_cast_2d_4: RayCast2D = $RayCast2D4
var health = 5
var knocked_back = false
var up = 0
@onready var corruption_manager: Node2D = $"../Player/Camera2D/corruption manager"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if health <= 0:
		corruption_manager.upgrade()
		queue_free()
	if position.y>10000:
		queue_free()
	
	up = 0
	
	if knocked_back:
		if player.position.x>position.x:
			if not ray_cast_2d_4.is_colliding():
				position.x+=delta*(-750)

		else:
			if not ray_cast_2d.is_colliding():
				position.x-=delta*(-750)



	else:
		if not confused:
			if player.position.x>position.x:
				if not ray_cast_2d.is_colliding():
					position.x+=delta*(750)
				else:
					up=1
					
					if not ray_cast_2d_3.is_colliding():
						position.y-=850*delta
					

			else:
				if not ray_cast_2d_4.is_colliding():
					
					position.x-=delta*(750)
				else:
					up = 1
					if not ray_cast_2d_3.is_colliding():
						position.y-=850*delta

	if not ray_cast_2d_2.is_colliding() and not up:
		position.y+=650*delta		
	
func confusion() -> void:
	confused = 1
func unconfusion() -> void:
	confused = 0



func _on_body_entered(body: Node2D) -> void:
	if type==1:
		health_manager.ouch2()
	else:
		
		health_manager.ouch()
	
@onready var health_manager: Node2D = $"../Player/Camera2D/health manager"



func _on_knock_back_timeout() -> void:
	knocked_back = false


func _on_body_exited(body: Node2D) -> void:
	if type==1:
		health_manager.unouch2()
	else:
		
		health_manager.unouch()
	pass # Replace with function body.


func _on_display_timer_timeout() -> void:
	display_label.text = ""


func _on_area_entered(area: Area2D) -> void:
	ouch(area.get_parent().damage)
