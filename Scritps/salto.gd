extends Node2D

const JUMP_VELOCITY = -260.0

@onready var Player: CharacterBody2D = $".."
@onready var sonido_salto: AudioStreamPlayer = $salto
@onready var Temporizador_coyote_time: Timer = $temporizador

var dentro_de_coyote_time:bool = false
var colisionando_con_el_suelo:bool = false
@export var duracion: float = 0.15

func _ready() -> void:
	Player = get_parent()
	Temporizador_coyote_time.timeout.connect(on_temporizador_timeout)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Jump up") and (Player.is_on_floor() or dentro_de_coyote_time):
		Player.velocity.y = JUMP_VELOCITY
		sonido_salto.play()
	
	if colisionando_con_el_suelo and not Player.is_on_floor() and Player.get_real_velocity().y >= 0:
		dentro_de_coyote_time = true
		Temporizador_coyote_time.start(duracion)
	
	colisionando_con_el_suelo = Player.is_on_floor()

func on_temporizador_timeout() -> void:
	dentro_de_coyote_time = false
