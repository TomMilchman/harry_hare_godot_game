extends Node

#Player's starting position when entering a room
var starting_pos: Vector2
#Player's spawning direction
var spawn_facing_right: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	starting_pos = Vector2(500,700)
	spawn_facing_right = true
