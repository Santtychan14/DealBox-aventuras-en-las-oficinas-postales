extends Area2D

@onready var platform_jump: AudioStreamPlayer = $platform_jump

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.velocity.y = -450
		$AnimatedSprite2D.play("Jump pad activado")
		platform_jump.play()
