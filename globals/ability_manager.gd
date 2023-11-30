extends Node

var unlocked_abilities: Array = []

func add_ability(ability_name: String) -> void:
	if not unlocked_abilities.has(ability_name):
		unlocked_abilities.append(ability_name) 

func has_ability(ability_name: String) -> bool:
	return unlocked_abilities.has(ability_name)
