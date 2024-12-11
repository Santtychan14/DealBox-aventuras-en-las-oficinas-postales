extends Area2D
var current_scene

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.win()
		body.dead = true
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://Escenas/niveles/nivel_prototipo_2.tscn")
