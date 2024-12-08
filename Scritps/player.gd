extends CharacterBody2D


const SPEED = 160.0
var life = 3
var puntuaje = 0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


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
	
func puntos():
	puntuaje += 1
	$"../UI/Puntos".text = str(puntuaje)
	


	
	
	


	
	
