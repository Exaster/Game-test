extends Area2D

@onready var animated_sprite: AnimatedSprite2D = $"../AnimatedSprite2D"
@onready var killzone: Area2D = $"../AnimatedSprite2D/Killzone"
@onready var head_zone: Area2D = %Head_zone


func _on_body_entered(body: Node2D) -> void:
	print("Slime died!")

	if killzone:
		killzone.set_process(false)
		killzone.set_process_input(false)
		killzone.monitoring = false
		killzone.monitorable = false
	
	if head_zone:
		head_zone.set_process(false)
		head_zone.set_process_input(false)
		head_zone.monitoring = false
		head_zone.monitorable = false

	position.x +=0
	animated_sprite.play("dying")

	await animated_sprite.animation_finished
	
	var parent_node = get_parent()
	var collision_shape = parent_node.get_node_or_null("CollisionShape2D")
	if collision_shape:
		collision_shape.queue_free()
	parent_node.queue_free()
