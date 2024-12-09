extends Button

@onready var progress_bar: TextureProgressBar = $card/VBoxContainer/ProgressBar
var value = 50
@onready var add: AudioStreamPlayer = $"../../../../../../add"
@onready var substract: AudioStreamPlayer = $"../../../../../../substract"
@onready var open: AudioStreamPlayer = $"../../../../../../open"
@onready var close: AudioStreamPlayer = $"../../../../../../close"

@onready var card: ColorRect = $card
var opened_card = false

func _on_pressed() -> void:
	if opened_card == false:
		var tween = create_tween()
		#27 to 88
		tween.tween_property(card,"position:x",88,0.5).set_trans(Tween.TRANS_BACK)
		opened_card = true
		open.play()
	else:
		var tween = create_tween()
		tween.tween_property(card,"position:x",27,0.5).set_trans(Tween.TRANS_BACK)
		opened_card = false
		close.play()

func _on_minus_pressed() -> void:
	progress_bar.value -= 8
	substract.play()
	var BUS_ID = AudioServer.get_bus_index(str(name))
	AudioServer.set_bus_volume_db(BUS_ID, linear_to_db(progress_bar.value/100))
	AudioServer.set_bus_mute(BUS_ID, progress_bar.value < .05)


func _on_plus_pressed() -> void:
	progress_bar.value += 8
	add.play()
	var BUS_ID = AudioServer.get_bus_index(str(name))
	AudioServer.set_bus_volume_db(BUS_ID, linear_to_db(progress_bar.value/100))
	AudioServer.set_bus_mute(BUS_ID, progress_bar.value < .05)
