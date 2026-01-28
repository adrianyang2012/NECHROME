extends Area2D

@onready var villager_face: Sprite2D = $"../VillagerFace"

# Called when the node enters the scene tree for the first time.
@onready var game: Node2D = $".."
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	villager_face.queue_free()
	game.summonboss()
	queue_free()
