extends Area2D

var room_location: String

func _ready():
	room_location = get_tree().current_scene.scene_file_path
	print(room_location)
	
	if (PlayerGlobals.spawn_room_location != room_location or PlayerGlobals.spawn_pos != global_position):
		$AnimationPlayer.play("lowered")
	else:
		$AnimationPlayer.play("raised")

func _on_body_entered(_body):
	PlayerGlobals.spawn_room_location = room_location
	PlayerGlobals.spawn_pos = global_position
	
	$AnimationPlayer.play("raised")
