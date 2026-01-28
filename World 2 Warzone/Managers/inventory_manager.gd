extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var sprite_2d_2: Sprite2D = $Sprite2D2
@onready var sprite_2d_3: Sprite2D = $Sprite2D3
@onready var label: Label = $Label
@onready var label_2: Label = $Label2
@onready var label_3: Label = $Label3
@onready var health_manager: Node2D = $"../Camera2D/health manager"

var apples = 0
var invis = 0
var sugar = 0
func apple_gain() -> void:
	apples+=1
	label.text = str(apples)
func invisible_gain() -> void:
	invis+=1
	label_2.text = str(invis)
func sugar_gain() -> void:
	sugar+=1
	label_3.text = str(sugar)
func apple_loss() -> void:
	apples-=1
	label.text = str(apples)
func invisible_loss() -> void:
	invis-=1
	label_2.text = str(invis)
func add_supplies() -> void:
	sugar_gain()
	apple_gain()
	apple_gain()
	parachute()
func super_jump() -> void:
	sprite_2d_7.visible = true
@onready var sprite_2d_4: Sprite2D = $Sprite2D4
@onready var sprite_2d_5: Sprite2D = $Sprite2D5
@onready var sprite_2d_6: Sprite2D = $Sprite2D6
@onready var sprite_2d_7: Sprite2D = $Sprite2D7


func dash_unlock() -> void:
	sprite_2d_6.visible = true
func bow_unlock() -> void:
	sprite_2d_4.visible = true
func parachute() -> void:
	sprite_2d_5.visible = true
func sugar_loss() -> void:
	sugar-=1
	label_3.text = str(sugar)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("apple") and apples>0:
		apple_loss()
		health_manager.heal()
	if Input.is_action_just_pressed("sugar") and sugar>0:
		sugar_loss()
		health_manager.long_heal()
