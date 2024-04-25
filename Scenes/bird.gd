extends CharacterBody2D

class_name bird

signal bird_crashed

@export var gravity = 900.0
@export var jump_force = -300 
var rotation_speed = 2

@onready var animation_player = $AnimationPlayer

var max_speed = 400
var is_started = false

func  _ready():
	velocity = Vector2.ZERO
	animation_player.play("idle")
	
func _physics_process(delta): #using physics process instead of process because the change of position is based on velicity rather than changing position
	if Input.is_action_just_pressed("jump"):
		if !is_started:
			animation_player.play("Flying")
			is_started = true
		jump()
		animation_player.play("Flying")
	if !is_started:
		return 
	velocity.y += gravity * delta #delta is the time elapsed from the last frame.
	velocity.y = min(velocity.y, max_speed)
	
	move_and_collide(velocity * delta) #used to detect collision on the object
	
	rotate_bird() 
	

func jump():
	velocity.y = jump_force
	rotation = deg_to_rad(-30)

func rotate_bird():
	#rotate when falling
	if velocity.y > 0  and rad_to_deg(rotation) < 90:
		rotation += rotation_speed * deg_to_rad(1)
	#Rotate upwards when rising
	elif velocity.y < 0 and rad_to_deg(rotation) > -30:
		rotation -= rotation_speed * deg_to_rad(1)
	
func _on_body_entered(body):
	pass # Replace with function body.
