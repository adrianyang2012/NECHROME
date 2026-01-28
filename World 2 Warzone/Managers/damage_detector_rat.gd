extends Area2D
@onready var rat: Area2D = $".."

@onready var label: Label = $Label
@onready var timer: Timer = $Timer


func _on_area_entered(area: Area2D) -> void:
	var damage_dealt = area.get_parent().damage
	rat.ouch(damage_dealt)
	label.text = str(damage_dealt)
	timer.start()
		
func _on_timer_timeout() -> void:
	
	label.text = ""
