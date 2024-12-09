extends Area2D

var going_right = true
var speed = 30
@onready var sprite_2d: Sprite2D = $Sprite2D


# Hace esto oink xd
func _physics_process(delta: float) -> void:
	
	if going_right == true:
		position.x += speed * delta
	else:
		position.x -= speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.life -= 1
		body.lose_hearth()
	speed = 0
	await get_tree().create_timer(0.5).timeout
	speed = 30
	if going_right == true:
		sprite_2d.flip_h = true
		going_right = false
	else:
		sprite_2d.flip_h = false
		going_right = true
