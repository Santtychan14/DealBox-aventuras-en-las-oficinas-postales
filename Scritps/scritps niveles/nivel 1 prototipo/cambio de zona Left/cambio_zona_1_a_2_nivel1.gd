extends Area2D

var current_scene

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		current_scene = get_tree().current_scene.name
	if current_scene != "nivel prototipo 2":
		get_tree().change_scene_to_file("res://Escenas/niveles/nivel_prototipo_2.tscn")
