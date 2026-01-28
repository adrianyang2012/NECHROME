extends Node

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func real_game() -> void:
	audio_stream_player.play()
