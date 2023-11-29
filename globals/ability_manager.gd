extends Node

var unlocked_abilities = {}

func add_ability(ability_name: String) -> void:
	if not unlocked_abilities.has(ability_name):
		var ability_to_load = "res://abilities/"+ ability_name + ".gd"
		var ability = load(ability_to_load)
		unlocked_abilities[ability_name] = ability

func has_ability(ability_name: String) -> bool:
	return unlocked_abilities.has(ability_name)
