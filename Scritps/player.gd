extends CharacterBody2D

var SPEED = 140.0
var velocidadnormal = SPEED
var life = 3
var puntuaje = 0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var camera_2d: Camera2D = $Camera2D
@onready var shake_timer: Timer = $Camera2D/shake_timer
@onready var life_vignette: TextureRect = $"../UI/life_vignette"
@onready var PasarNivel = $"../UI/pasar_nivel"
#Sonidos
@onready var pickup: AudioStreamPlayer = $pickup
@onready var damage: AudioStreamPlayer = $damage
@onready var timer: Timer = $"../Area2D/Timer"

func _physics_process(delta: float) -> void:
	if life <= 0:
		get_tree().reload_current_scene()

	# Gravedad
	if not is_on_floor():
		velocity += get_gravity() * delta

	#Movimiento
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction > 0:
		animated_sprite_2d.flip_h = false
	if direction < 0:
		animated_sprite_2d.flip_h = true
		
	if Input.is_action_pressed("Shift"):
		if  direction > 0:
			velocity.x += 100
		elif direction <0:
			velocity.x += -100
		
	move_and_slide()

#Sistema de Corazones
func lose_all_hearth():
	$"../UI/hearths".hide()
#	Aqui deberia ir tambien un damage_vignette pero de color azul diria yo, agregalo oink55 

func lose_hearth():
	$"../UI/hearths".size.x -= 14
	damage_vignette()
	damage.play()
	
#Sistema de Puntos
func puntos():
	puntuaje += 1
	$"../UI/Puntos".text = str(puntuaje)
	pickup.play()
	
# voy a a hacer que cuando toque el enemigo se mueva un poco la camara, para mas feedback
func camera_shake():
	shake_timer.start()

func damage_vignette():
	var tween = get_tree().create_tween()
	tween.tween_property(life_vignette,"modulate",Color(1,1,1,0.25),0.15)
	tween.tween_property(life_vignette,"modulate",Color(1,1,1,0),0.25)
	
#PowerUp Uno
func poweruno():
	$"../UI/hearths".size.x += 14
	

	
