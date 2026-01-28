extends Sprite2D

@onready var control: Control = $"../.."


func _on_button_pressed() -> void:
	control.change2()
