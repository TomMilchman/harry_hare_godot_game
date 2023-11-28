extends Area2D

@export_group("Transtion Point Props")
@export var transition_scene: String
@export var transition_position: Vector2
@export var face_right: bool
@export_group("")

func _on_body_entered(body):
	TransitionLayer.transition_to_room(transition_scene, transition_position, face_right)
