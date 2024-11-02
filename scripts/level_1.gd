extends Node2D

@onready var audio_player: AudioStreamPlayer = $Player/AudioStreamPlayer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $Player/AudioStreamPlayer2D

func _ready() -> void:
	audio_player.play()
func _process(delta: float) -> void:
	pass
