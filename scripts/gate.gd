extends Node2D

@export var coins_needed: int = 10
@export var closed_image: Texture2D
@export var opened_image: Texture2D
@export var closed_text: String = "Gate Closed"
@export var opened_text: String = "Gate Open"

@onready var sprite: Sprite2D = $Sprite2D
@onready var label: Label = $Label
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

var game_manager: Node = null

func _ready():
	game_manager = get_tree().root.get_node("GameManager")
	if not game_manager:
		print("Warning: GameManager not found")
	
	update_gate_state()

func update_gate_state():
	if game_manager and game_manager.has_method("get_score"):
		var score = game_manager.call("get_score")
		if score >= coins_needed:
			sprite.texture = opened_image
			label.text = opened_text
			collision_shape.disabled = true
		else:
			# Gate is closed
			sprite.texture = closed_image
			label.text = closed_text
			collision_shape.disabled = false 
