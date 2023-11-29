extends AbilityBase

static func execute(player: Player):
	if Input.is_action_just_pressed("air dash"):
		print("double jump!")
