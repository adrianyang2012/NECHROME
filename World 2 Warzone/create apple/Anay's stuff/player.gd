extends CharacterBody2D
@onready var tiles: TileMap = $"../Tiles"
@onready var game_manager: Node = $"../Game Manager"
@onready var timer: Timer = $Timer
@onready var dash: Timer = $Dash
@onready var super_jump: Timer = $"Super Jump"
@onready var pound: Timer = $Pound
@onready var coyote_time: Timer = $"Coyote Time"
@export_range(0.0, 1.0) var decelarate_on_jump_release: float = 0.5 
var SPEED = 300.0
var jump_count = 0
var jump_force = -700.0
var dash_count = 0 
func jump():
	velocity.y = jump_force
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jump_count = 0
	# Handle jump.
	if Input.is_action_just_pressed("jump") and jump_count < 2:
		jump_count += 1
		velocity.y = jump_force
	elif is_on_wall_only():
		jump_count = 0
		jump_force = 0
	else:
		jump_force = -700.0 
		
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y *= decelarate_on_jump_release
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * SPEED * 2
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_just_pressed("hitch-a-ride"):
		$Dash.start()
		SPEED *= 10 
		velocity.x = direction * SPEED
	if Input.is_action_just_pressed("Super Jump") and jump_count < 2:
		$"Super Jump".start()
		jump_count += 1
		velocity.y = jump_force * 2
	if Input.is_action_just_pressed("Pound") and not is_on_floor():
		$Pound.start()
		velocity += get_gravity() * delta * get_gravity() 

	move_and_slide()


func _on_timer_timeout() -> void:
	game_manager.decrease_health()


func _on_giga_heart_body_entered(_body: Node2D) -> void:
	game_manager.increase_health()


func _on_dash_timeout() -> void:
	SPEED = 300.0


func _on_super_jump_timeout() -> void:
	jump_force = -700.0


func _on_pound_timeout(_delta) -> void:
	velocity.y = jump_force
