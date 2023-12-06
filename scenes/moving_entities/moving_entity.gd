extends Path2D
class_name MovingEntity

@export var loop = true
@export var speed = 2.0
@export var speed_scale = 1.0
@export var initially_flip: bool
@export var flip_on_turn: bool
@export var moving_right: bool

@onready var path = $PathFollow2D
@onready var animation = $AnimationPlayer
@onready var sprite = $AnimatableBody2D/Sprite2D

var prev_x: int

# Called when the node enters the scene tree for the first time.
func _ready():
	if not loop:
		animation.play("move")
		animation.speed_scale = speed_scale
	
	prev_x = sprite.global_position.x
	sprite.flip_h = initially_flip

func _process(_delta):
	if loop:
		path.progress += speed
	
	if flip_on_turn:
		var current_x: int = sprite.global_position.x
		
		if moving_right:
			if current_x < prev_x:
				sprite_flip()
				moving_right = false
		else:
			if current_x > prev_x:
				sprite_flip()
				moving_right = true
				
		prev_x = sprite.global_position.x
		
func sprite_flip():
	sprite.flip_h = not sprite.flip_h
