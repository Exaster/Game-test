extends Area2D
@onready var timer = $Timer

func _on_body_entered(body):
	print("Monster died!")
	body.get_node("CollisionShape2D").queue_free()
	Engine.time_scale = 0.5
	timer.start()


func _on_timer_timeout():
	Engine.time_scale = 1
