extends Area2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.life += 1
		body.poweruno()
		queue_free()
