extends AbilityBase

var in_cooldown: bool = false

func execute(player: Player):
	if Input.is_action_just_pressed("jump") and not player.is_on_floor():
		if not in_cooldown:
			player.play_animation("double_jump")
			player.velocity.y = player.JUMP_VELOCITY
			in_cooldown = true
	if player.is_on_floor():
		in_cooldown = false
