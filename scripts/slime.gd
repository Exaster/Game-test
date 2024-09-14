extends Node2D
@export var SPEED = 60
var direction = 1
var stomp_impulse := 600.0

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D

@onready var killzone: Area2D = $"../AnimatedSprite2D/Killzone"
func _process(delta):
	
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	
	position.x += direction * SPEED * delta

func kill() ->void:
	pass
