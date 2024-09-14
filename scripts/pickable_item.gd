extends Node2D

@export var item_index: int = 1  # Index for the checkbox (1 to 4)

@onready var collision_area: Area2D = $Area2D

signal item_picked(index: int)  # Define signal to emit when item is picked

func _ready() -> void:
	collision_area.connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body: Node) -> void:
	emit_signal("item_picked", item_index)
	print("item_picked"+str(item_index))
	queue_free()  # Remove the item from the scene
