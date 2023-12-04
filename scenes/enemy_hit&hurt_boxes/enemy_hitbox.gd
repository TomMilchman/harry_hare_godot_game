extends Area2D

signal deal_damage(body)

var body_is_inside: bool = false

func _on_body_entered(_body):
	body_is_inside = true

func _on_body_exited(_body):
	body_is_inside = false

func _process(_delta):
	if body_is_inside:
		for body in get_overlapping_bodies():
			deal_damage.emit(body)
