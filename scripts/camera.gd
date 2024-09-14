extends Camera2D

var shake_duration = 0.0
var shake_intensity = 10.0
var original_position = Vector2.ZERO


func _ready():
	original_position = position

func _process(delta):
	if shake_duration > 0:
		shake_duration -= delta
		position = original_position + Vector2(randf_range(-shake_intensity, shake_intensity), randf_range(-shake_intensity, shake_intensity))
		if shake_duration <= 0:
			position = original_position
