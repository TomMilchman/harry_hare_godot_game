extends Node2D

@onready var camera = $Player/Camera2D
@onready var camera_limit_pos = $CameraLockArea/CollisionShape2D.global_position
@onready var camera_limit_shape = $CameraLockArea/CollisionShape2D.get_shape()

@export var ui: UI

# Called when the node enters the scene tree for the first time.
func _ready():
	#Connect health changed signal to UI
	if not PlayerGlobals.health_changed.is_connected(ui._update_health_label):
		PlayerGlobals.health_changed.connect(ui._update_health_label)
		
	#Lock camera to the bounds of the CameraLockArea's CollisionShape2D
	camera.limit_left = camera_limit_pos.x - camera_limit_shape.size.x / 2
	camera.limit_right = camera_limit_pos.x + camera_limit_shape.size.x / 2
	camera.limit_top = camera_limit_pos.y - camera_limit_shape.size.y / 2 
	camera.limit_bottom = camera_limit_pos.y + camera_limit_shape.size.y / 2
