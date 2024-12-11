extends Control

func _ready() -> void:
	presentacion()
func _process(delta: float) -> void:
	pass

func presentacion():
	var tween : Tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property($"Color_presentación/texto_presentación","modulate",Color.WHITE,2)
	tween.tween_property($"Color_presentación/texto_presentación","modulate",Color.TRANSPARENT,2)
	tween.tween_property($"Color_presentación/texto_presentación", "text", "Insertar logo o lo que sea", 0)
	tween.tween_property($"Color_presentación/texto_presentación","modulate",Color.WHITE,2)
	tween.tween_property($"Color_presentación/texto_presentación","modulate",Color.TRANSPARENT,2)
	# aqui podria poner un script para que inicie una musica
	tween.tween_property($"Color_presentación","position",Vector2(0,-300),1)

func _on_exit_pressed() -> void:
	pass # Replace with function body.

func _on_button_pressed() -> void:
	pass # Replace with function body.

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/niveles/nivel_prototipo.tscn")

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/menus/menu_opciones.tscn")
