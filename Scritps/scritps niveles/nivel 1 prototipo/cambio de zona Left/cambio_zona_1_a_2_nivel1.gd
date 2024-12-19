extends Area2D
var current_scene

func _ready() -> void:
	print(get_tree().current_scene.name)
	current_scene = str(get_tree().current_scene.name).to_int()
	print("current_scene:"+str(current_scene))
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.win()
		body.dead = true
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://Escenas/niveles/level"+str((current_scene+1))+".tscn")
