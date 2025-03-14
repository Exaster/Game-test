extends Node2D

const SPEED = 135
var direction = 1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animation_sprite = $AnimatedSprite2D


func _process(delta):
	Engine.max_fps = 60
	position.x += direction * SPEED * delta
