extends CharacterBody2D
@export var speed = 800.0
const JUMP_VELOCITY = -1000.0
var double = 0
var extra_jumps = 0
var floor = 0
var invis = 0
var cutscene_mode = 0
@onready var health_manager: Node2D = $"Camera2D/health manager"
@onready var label_1: Node2D = $"Camera2D/Label 1"
@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2
@onready var timer_3: Timer = $Timer3
@onready var timer_4: Timer = $Timer4
@onready var node: Node = $"../Node"
@onready var original_trilogy: Label = $Camera2D/Original_trilogy
@onready var timer_5: Timer = $Timer5
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var timer_7: Timer = $Timer7
@onready var timer_8: Timer = $Timer8

@onready var game: Node2D = $".."
@onready var timer_6: Timer = $Timer6

func enterdoor() -> void:
	sprite_2d.visible = false
func exitdoor() -> void:
	sprite_2d.visible = true

var check = 0
var progress = 0
var additional = 0
var started_dash = 0
func normal():
	#easy mode
	health_manager.normal()
	speed = 1200.0
func easy():
	health_manager.easy()
	speed = 1400.0
func tutorial():
	extra_jumps = 2
	health_manager.easy()
	speed = 1400
	position.x = 0
	position.y = 100
func hard():
	#hard mode
	speed = 800.0
	health_manager.hard()
func journey():
	speed = 1500
	health_manager.journey()
func change() -> void:
	#double jump added
	extra_jumps = 1

func _ready() -> void: 
	position.x = -71000
	position.y = 0
	rotation = 0.001
	#position.x = 19500
	#position.y = -5375
	
func stop() -> void:
	#stop cutscene mode
	cutscene_mode = 0
func cutscene() -> void:
	#cutscene mode
	cutscene_mode = 1
	#timer_4.start()

var tripled = 0
var acsess = 0
var super_jump_able = 0
func dash()->void:
	#dash enabled
	acsess = 1
func explode()-> void:
	#explosion after killing overlord (obselete)
	health_manager.explode()
func teleport()->void:
	#teleport to inner corruption bossfight area (obselete)
	position.x = 2100
	position.y = -8416
func zero_corruption() -> void: 
	#after defeating inner corruption (obselete)
	position.x  = 20670
	position.y = -100
var started = 0
var parachute = 0
func real_game() -> void:
	#intro end
	node.real_game()
	original_trilogy.visible = true
	timer_5.start()
func practice() -> void:
	#practice mode
	parachute = 0
	node.real_game()
var invis_mode = 0
func super_jump() -> void:
	super_jump_able = 1
@onready var inventory_manager: Node2D = $"Inventory manager"
@onready var sprite_2d_2: Sprite2D = $Sprite2D2
var parachute_usable = 0
func open_parachute() -> void:
	parachute_usable = 1
var super_jump_status = 0
var super_jump_buffer = 0
var pause = 0
var first = 1
var currently_hacking = 0
func speed_upgrade() -> void:
	extra_jumps+=1
	speed+=150
	first = 0
	
	
func reset() -> void:
	position.x = -71000
	position.y = 0

# Set this to true to enable developer mode.
@export var HACKER_MODE = true

func _physics_process(delta: float) -> void:
	# parachute manager and enables parachute only if you unlocked and if you are pressing p
	if HACKER_MODE == true:
		if Input.is_action_pressed("TEST_START") and not currently_hacking:
			speed = 12000
			extra_jumps = 1000
			currently_hacking = true
		if Input.is_action_pressed("TEST_STOP"):
			speed = 800
			extra_jumps = 0
			currently_hacking = false
	if super_jump_buffer:
		super_jump_buffer = 0
		super_jump_status = 1
	parachute = 0
	sprite_2d_2.visible = false
	if parachute_usable and Input.is_action_pressed("parachute") and velocity.y>250:
		parachute = 1
		sprite_2d_2.visible = true
	#super jump manager
	if super_jump_able and Input.is_action_pressed("superjump"):
		pause = 1 #the float effect after superjump start
		timer_8.start()
		
	#invis effect manager
	if invis_mode: 
		game.invis()
		
		sprite_2d.self_modulate = Color(1,1,1,0.1)
	else:
		sprite_2d.self_modulate = Color(1,1,1,1)
	#movement
		
	if not is_on_floor():
			velocity += get_gravity() * delta*(1-parachute*0.9)
	if not cutscene_mode:
		#manages invis turning on and off
		if Input.is_action_just_pressed("invis") and invis>0:
			invis-=1
			inventory_manager.invisible_loss()
			timer_6.start()
			invis_mode = 1
		#gravity

		
		
		# Handle jump.
		if check==1:
			
			if not is_on_floor():
				
				floor = 0
				
		else:
			#coyote time manager
			if not is_on_floor() and not started:
				started = 1
				timer.start()
		#coyote time more
		if is_on_floor():
			floor = 1
			check = 0
		
	
	
		#jump
		if super_jump_status:
			velocity.y = JUMP_VELOCITY*1.5
			super_jump_status = 0
			print('locked')
		else:
			if Input.is_action_just_pressed("ui_up") and (floor or double<extra_jumps):
				velocity.y = JUMP_VELOCITY*(1-parachute*0.5)
				
					
				if is_on_floor():
					double = 0
				double+=1
		
		#double jump manager
		if is_on_floor():
			double = 0
			
		#right and left
		var direction := Input.get_axis("ui_left", "ui_right")
		if Input.is_action_just_pressed("dash"):
			if acsess==1:
				acsess = 0
				additional = 1
				timer_2.start()
		#right and left movement manager

		if direction:
			rotation = 0.001*direction
			velocity.x = direction * speed*(1+3*additional) #additonal is dash
				
		else:
			velocity.x = move_toward(velocity.x, 0, speed*0.2)
		if pause:
			velocity.y = 0
	else:
		velocity.x = 0
	move_and_slide()
	


func _on_timer_timeout() -> void:
	#coyote time manager
	check = 1
	started = 0


func _on_timer_2_timeout() -> void:
	#dash unusable and slowly decreasing
	acsess = 0
	if additional>0.01:
		additional-=0.125
		timer_2.start()
	else:
		
		timer_3.start()


func _on_timer_3_timeout() -> void:
	#able to dash again
	acsess = 1


func _on_timer_4_timeout() -> void:
	#stop boss fight cutscene (obselete)
	cutscene_mode = 0


func _on_timer_5_timeout() -> void:
	#hide start text
	original_trilogy.visible = false
	pass # Replace with function body.

func add_invis() -> void:
	#add invisibility potion
	invis+=1
	inventory_manager.invisible_gain()
	


func _on_timer_6_timeout() -> void:
	
	game.uninvis()
	invis_mode = 0





func _on_timer_7_timeout() -> void:
	super_jump_able = 1
	

func _on_timer_8_timeout() -> void:
	super_jump_able = 0
	pause = 0
	super_jump_buffer = 1
	timer_7.start()
	pass # Replace with function body.
