extends Area2D

signal deal_damage(body)

var body_is_inside: bool = false

func _on_body_entered(body):
	body_is_inside = true
	print(true)

func _on_body_exited(body):
	body_is_inside = false
	print(false)

func _process(_delta):
	if body_is_inside:
		for body in get_overlapping_bodies():
			deal_damage.emit(body)
