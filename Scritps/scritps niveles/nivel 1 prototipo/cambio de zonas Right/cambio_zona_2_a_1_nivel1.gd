extends Area2D

var  current_scene

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		current_scene = get_tree().current_scene.name
	if current_scene != "nivel prototipo":
		get_tree().change_scene_to_file("res://Escenas/niveles/nivel_prototipo.tscn")

func _on_cambio_de_zona_left_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
