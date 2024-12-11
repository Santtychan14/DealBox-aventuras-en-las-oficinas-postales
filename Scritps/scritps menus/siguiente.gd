extends Button

var escenas = [
	"res://Escenas/niveles/nivel_prototipo.tscn",
	"res://Escenas/niveles/nivel_prototipo_2.tscn",
	"res://Escenas/niveles/nivel prototipo 3.tscn"
]

var escena_actual = 0

func _on_pressed():
	escena_actual += 1
	if escena_actual < escenas.size():
		get_tree().change_scene_to_file(escenas[escena_actual])
	else:
		print("No hay más escenas para cargar.")  
