extends Node2D
@onready var player: CharacterBody2D = $Player


var scene = load("res://Managers/arrow_manager.tscn")
var scene2 = load("res://obselete/fake_spider.tscn")
var scene4 = load("res://level design stuff/rat.tscn")
var scene5 = load("res://level design stuff/glider_rat.tscn")
var scene6 = load("res://Managers/sword.tscn")
var scene7 = load("res://Managers/motherbrain.tscn")
var scene8 = load("res://level design stuff/Danger zone/guardian_2.tscn")
var scene3 = load("res://Managers/gun.tscn")
var enemies = []
var bow = 0
var swordinstance = scene6.instantiate()
var bowinstance = scene3.instantiate()
func _ready() -> void:
	player.hard()

func create() -> void:
	bow = 1
	add_child(bowinstance)
	if is_instance_valid(swordinstance):
		swordinstance.queue_free()

func _process(delta: float)-> void:
	if bow and Input.is_action_just_pressed("attack"):
		var instance = scene.instantiate()
		add_child(instance)
# Called when the node enters the scene tree for the first time.
func hide_bow() -> void:
	bowinstance.visible = false
func show_bow() -> void:
	bowinstance.visible = true
func summon(x,y,health) -> void:
	var instance = scene5.instantiate()
	add_child(instance)
	
	instance.position.x = x
	instance.position.y = y
	instance.health = health
	enemies.append(instance)

#summon 2 is only summoning glider rats
func summon2(x,y,health) -> void:
	if randf()<0.25:
		var instance = scene5.instantiate()
		add_child(instance)
		
		instance.position.x = x
		instance.position.y = y
		instance.health = health
		enemies.append(instance)
	else:
		var instance = scene4.instantiate()
		add_child(instance)
		
		instance.position.x = x
		instance.position.y = y
		instance.health = health
		enemies.append(instance)

func invis() -> void:
	for x in enemies:
		if is_instance_valid(x):
			x.confusion()
func guardian() -> void:
	var instance = scene8.instantiate()
	add_child(instance)
func uninvis() -> void:
	for x in enemies:
		if is_instance_valid(x):
			x.unconfusion()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func sword() -> void:
	
	add_child(swordinstance)


func _on_button_button_down() -> void:
	
	for i in range(50):
		var instance = scene2.instantiate()
		add_child(instance)
func summonboss() -> void:
	var instance = scene7.instantiate()
	add_child(instance)
