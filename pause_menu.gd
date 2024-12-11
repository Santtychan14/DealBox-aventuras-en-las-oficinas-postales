extends Panel

@onready var vignette: TextureRect = $vignette


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		var tween = create_tween().set_parallel(true)
		tween.tween_property(self,"position:y", 0, 0.5).set_trans(Tween.TRANS_CIRC)
		tween.tween_property(vignette,"modulate", Color(1, 1, 1, 0.5), 0.2).set_trans(Tween.TRANS_CIRC)
		get_tree().paused = true
		
		
func _on_resume_pressed() -> void:
	var tween = create_tween().set_parallel(true)
	tween.tween_property(self,"position:y", -180, 0.5).set_trans(Tween.TRANS_CIRC)
	tween.tween_property(vignette,"modulate", Color(1, 1, 1, 0), 0.2).set_trans(Tween.TRANS_CIRC)
	get_tree().paused = false

func _on_settings_pressed() -> void:
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/menus/pantalla_inicio.tscn")
