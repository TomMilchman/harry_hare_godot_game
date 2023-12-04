extends Area2D

signal collected(heal_amount)

@export var heal_amount: int = 1

func _on_body_entered(_body):
	collected.emit(heal_amount)
	queue_free()
