extends Node

class_name Ground
@export var speed = -150

@onready var sprite1 = $Ground1/Sprite2D
@onready var sprite2 = $Ground2/Sprite2D

func _ready(): #assigns postion of sprite 2 which is going to be equal to the position of sprite 1 plus its width
	sprite2.global_position.x = sprite1.global_position.x + sprite1.texture.get_width()


func _process(delta): #changes position of sprites (changing it by the (assigned speed times the time between change of frame)
	sprite1.global_position.x += speed * delta
	sprite2.global_position.x += speed * delta
	#if sprite1 has left completely the screen its moved to the right of sprite2
	if sprite1.global_position.x < -sprite1.texture.get_width():
		sprite1.global_position.x = sprite2.global_position.x + sprite2.texture.get_width()
	#if sprite2 has left completely the screen its moved to the right of sprite1
	if sprite2.global_position.x < -sprite2.texture.get_width():
		sprite2.global_position.x = sprite1.global_position.x + sprite1.texture.get_width()

