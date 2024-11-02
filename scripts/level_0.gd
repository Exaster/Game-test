extends Node2D

const NEXT_LEVEL_PATH = "res://Levels/level_1.tscn"

@onready var video_stream_player: VideoStreamPlayer = $VideoStreamPlayer

func _ready():
	video_stream_player.play()
	video_stream_player.connect("finished", Callable(self, "_on_video_finished"))

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		_skip_video()
	elif event is InputEventKey and event.pressed:
		_skip_video()

func _skip_video():
	video_stream_player.stop()
	_on_video_finished()

func _on_video_finished():
	get_tree().change_scene_to_file(NEXT_LEVEL_PATH)
