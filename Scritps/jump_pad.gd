extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.velocity.y = -350
		$AnimatedSprite2D.play("Jump pad activado")
