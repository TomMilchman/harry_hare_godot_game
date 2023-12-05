extends Path2D
class_name MovingEntity

@export var loop = true
@export var speed = 2.0
@export var speed_scale = 1.0
@export var not_flip: bool = false

@onready var path = $PathFollow2D
@onready var animation = $AnimationPlayer
@onready var sprite = $AnimatableBody2D/Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if not loop:
		animation.play("move")
		animation.speed_scale = speed_scale
		set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	path.progress += speed
	
func flip():
	not_flip = not not_flip
	sprite.flip_h = not_flip
	
