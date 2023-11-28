extends CanvasLayer

func transition_to_room(scene: String, pos: Vector2, 
face_right: bool):
	$AnimationPlayer.play("fade_to_black")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(scene)
	PlayerGlobals.starting_pos = pos
	PlayerGlobals.spawn_facing_right = face_right
	$AnimationPlayer.play_backwards("fade_to_black")
