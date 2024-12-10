extends CharacterBody2D


const SPEED = 160.0
var life = 3
var puntuaje = 0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var camera_2d: Camera2D = $Camera2D
@onready var shake_timer: Timer = $Camera2D/shake_timer
@onready var life_vignette: TextureRect = $"../UI/life_vignette"

#Sonidos
@onready var pickup: AudioStreamPlayer = $pickup
@onready var damage: AudioStreamPlayer = $damage



func _process(delta: float) -> void:
	if not shake_timer.is_stopped():
		camera_2d.offset.x = randf_range(0.1,2)
		camera_2d.offset.y = randf_range(0.1,2)
		

func _physics_process(delta: float) -> void:
	if life <= 0:
		get_tree().reload_current_scene()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction > 0:
		animated_sprite_2d.flip_h = false
	if direction < 0:
		animated_sprite_2d.flip_h = true
	move_and_slide()

func lose_hearth():
	$"../UI/hearths".size.x -= 14
	camera_shake()
	damage_vignette()
	damage.play()
	
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


	
	
