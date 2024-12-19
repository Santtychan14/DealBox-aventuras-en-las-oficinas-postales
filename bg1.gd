extends ParallaxBackground
@onready var camera_2d: Camera2D = $"../Player/Camera2D"
	
@onready var front: TextureRect = $front/front
@onready var street: TextureRect = $street/street
@onready var sidewalk_top: TextureRect = $sidewalk_bg/sidewalk_top
@onready var bg_top: TextureRect = $bg/bg_top
var camera_initial_pos_y = 0
var amplifier = 1



func _process(delta: float) -> void:
	front.scale.y = (-camera_2d.global_position.y/(13 * amplifier)) + 20
	street.scale.y = (-camera_2d.global_position.y/(6* amplifier)) + 59
	sidewalk_top.scale.y = (-camera_2d.global_position.y/(26* amplifier)) + 10
	bg_top.scale.y = (-camera_2d.global_position.y/(30* amplifier)) + 4
