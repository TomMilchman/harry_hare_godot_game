extends Area2D

signal heal(heal_amount)

@export var heal_amount: int = 1

func _on_body_entered(_body):
	heal.emit(heal_amount)
	queue_free()
