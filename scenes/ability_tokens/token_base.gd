extends Node2D

@export var ability_name: String

func _ready():
	if AbilityManager.has_ability(ability_name):
		queue_free()

func _on_body_entered(body):
	if not AbilityManager.has_ability(ability_name) and body is Player:
		AbilityManager.add_ability(ability_name)
		queue_free()
