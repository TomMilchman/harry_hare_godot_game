extends Node2D

@onready var camera = $Player/Camera2D
@onready var pos = $CameraLockArea/CollisionShape2D.global_position
@onready var shape = $CameraLockArea/CollisionShape2D.get_shape()

# Called when the node enters the scene tree for the first time.
func _ready():
	#Lock camera to the bounds of the CameraLockArea's CollisionShape2D
	camera.limit_left = pos.x - shape.size.x / 2
	camera.limit_right = pos.x + shape.size.x / 2
	camera.limit_top = pos.y - shape.size.y / 2 
	camera.limit_bottom = pos.y + shape.size.y / 2
	
	
