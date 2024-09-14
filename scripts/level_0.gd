extends Node2D

const NEXT_LEVEL_PATH = "res://Levels/level_1.tscn"

@onready var video_stream_player: VideoStreamPlayer = $VideoStreamPlayer

func _ready():
	# Set the video and start playing it
	video_stream_player.play()

	# Connect the finished signal to the function
	video_stream_player.connect("finished", Callable(self, "_on_video_finished"))

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		# Skip video on mouse click
		_skip_video()
	elif event is InputEventKey and event.pressed:
		# Skip video on key press
		_skip_video()

func _skip_video():
	# Stop the video playback and go to the next step
	video_stream_player.stop()
	_on_video_finished()

func _on_video_finished():
	# Change to the next level
	get_tree().change_scene_to_file(NEXT_LEVEL_PATH)
