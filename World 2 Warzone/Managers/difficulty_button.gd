extends Button
@onready var button: Button = $"../../Button/Button"

@onready var animated_sprite_2d: AnimatedSprite2D = $".."
var cur_frame = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	cur_frame+=1
	if cur_frame>2:
		cur_frame = 0
	button.update()
	animated_sprite_2d.frame = cur_frame
