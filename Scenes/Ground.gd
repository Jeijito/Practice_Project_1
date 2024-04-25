extends Node

class_name Ground
@export var speed = -150

@onready var sprite1 = $Ground1/Sprite2D
@onready var sprite2 = $Ground2/Sprite2D

func _ready():
	sprite2.global_position.x = sprite1.global_position.x + sprite1.texture.get_width()


func _process(delta):
	sprite1.global_position.x += speed * delta
	sprite2.global_position.x += speed * delta


