extends Node

signal health_changed()

#Player health
const MAX_HEALTH := 3
var current_health:
	get:
		return current_health
	set(value):
		current_health = value
		health_changed.emit()

#These are used for determining where the player spawns after death
var spawn_room_location: String = "res://scenes/rooms/room_0.tscn"
var spawn_pos: Vector2 = Vector2(768, 584) #Always the same as the checkpoint location

#Player's starting position when entering a room
var starting_pos: Vector2
#Player's spawning direction
var spawn_facing_right: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	current_health = MAX_HEALTH
	starting_pos = spawn_pos
	spawn_facing_right = true
