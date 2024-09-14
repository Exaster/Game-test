extends Node

@onready var score_label: Label = $"Score Label"
@onready var score_label_2: Label = $"Score Label2"

var score = 0

func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + " coins!"
	score_label_2.text = "You collected " + str(score) + " coins!"
