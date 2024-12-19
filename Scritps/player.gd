extends CharacterBody2D

var SPEED = 140.0
var velocidadnormal = SPEED
var powerr = 1
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
@onready var die: AudioStreamPlayer = $die
var dead = false

func _physics_process(delta: float) -> void:
	print(camera_2d.global_position)
	if not shake_timer.is_stopped():
		camera_2d.offset.x = randf_range(0.1,powerr)
		camera_2d.offset.y = randf_range(0.1,powerr)
	if shake_timer.is_stopped():
		camera_2d.offset = Vector2(0,0)
		
	if $"../UI/hearths".size.x < 1:
		if dead == false:
			dead = true
			lose_all_hearth()
			await die.finished
			get_tree().reload_current_scene()

	if dead == false:
		# Gravedad
		if not is_on_floor():
			velocity += get_gravity() * delta

		#Movimiento
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
			if not animated_sprite_2d.is_playing():
				animated_sprite_2d.play("walk")
		else:
			if velocity.x < 5 or velocity.x > -5:
				velocity.x -= velocity.x / 5
			else: 
				velocity.x = move_toward(velocity.x, 0, SPEED)
			if not animated_sprite_2d.is_playing():
				animated_sprite_2d.play("idle")
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

func lose_hearth():
	$"../UI/hearths".size.x -= 17
	damage_vignette()
	camera_shake(0.2,3)
	damage.play()
	animated_sprite_2d.play("hit")
	
func lose_all_hearth():
	$"../UI/hearths".hide()
	damage_vignette()
	camera_shake(0.5,5)
	die.play()
	animated_sprite_2d.play("game_over")
#	Aqui deberia ir tambien un damage_vignette pero de color azul diria yo, agregalo oink55 

#Sistema de Puntos
func puntos():
	puntuaje += 1
	$"../UI/Puntos".text = str(puntuaje)
	pickup.play()
	
# voy a a hacer que cuando toque el enemigo se mueva un poco la camara, para mas feedback
func camera_shake(timer, power):
	shake_timer.wait_time = timer
	powerr = power
	shake_timer.start()

func damage_vignette():
	var tween = get_tree().create_tween()
	tween.tween_property(life_vignette,"modulate",Color(1,1,1,0.25),0.15)
	tween.tween_property(life_vignette,"modulate",Color(1,1,1,0),0.25)
	
#PowerUp Uno
func poweruno():
	pickup.play()
	$"../UI/hearths".size.x += 17
	$"../UI/empty_hearths".size.x += 17
	
func win():
	animated_sprite_2d.play("win")
	$win.play()

	
