extends Control

func changemedium() -> void:
	get_tree().change_scene_to_file("res://games/game2.tscn")
func changeeasy() -> void:
	get_tree().change_scene_to_file("res://games/game_3.tscn")
func changehard() -> void:
	get_tree().change_scene_to_file("res://games/game.tscn")
func change2() -> void:
	get_tree().change_scene_to_file("res://games/instructions.tscn")
func changejourney() -> void:
	get_tree().change_scene_to_file("res://games/game_journey.tscn")
func changetutorial() -> void:
	get_tree().change_scene_to_file("res://games/practice_game.tscn")
