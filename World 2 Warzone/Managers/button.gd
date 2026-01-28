extends Button

		
@onready var control: Control = $"../../.."
var difficulty = 0
func _on_pressed() -> void:
	if difficulty==0:
		control.changeeasy()
	elif difficulty ==1:
		control.changemedium()
	else:
		control.changehard()
	
		
func update() -> void:
	difficulty+=1
	if difficulty>2:
		difficulty = 0



func _on_button_pressed() -> void:
	control.changejourney()
	pass # Replace with function body.


func _on_tutorial_button_pressed() -> void:
	control.changetutorial()
