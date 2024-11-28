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
