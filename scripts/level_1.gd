extends Node2D


# Onready variable to reference the AudioStreamPlayer
@onready var audio_player: AudioStreamPlayer = $Player/AudioStreamPlayer

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $Player/AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Play the audio when the scene starts
	audio_player.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
