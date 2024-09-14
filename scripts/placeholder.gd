extends Area2D

@onready var text_label: Label = $Label  
@export var display_text: String = "Default Text"

func _ready():

	text_label.text = display_text
	text_label.visible = false

	
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body: Node2D) -> void:
	print("Entered Zone!")
	text_label.visible = true  

func _on_body_exited(body: Node2D) -> void:
	print("Exit Zone!")
	text_label.visible = false
