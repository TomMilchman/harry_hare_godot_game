extends AbilityBase

#Determines if the ability can be used again or not
var in_cooldown: bool = false

var speed = 900
var x_direction: int

func execute(player: Player):
	if Input.is_action_just_pressed("air dash") and not player.is_on_floor():
		if not in_cooldown:
			in_cooldown = true
			
			if player.facing_right:
				x_direction = 1
			else:
				x_direction = -1
			
			player.disabled_basic_movement = true
			var tween = create_tween()
			tween.tween_property(player, "velocity", Vector2(x_direction * speed, 0), 0.3)
			player.play_animation("air_dash")
			await tween.finished
			player.disabled_basic_movement = false
			player.play_animation("jump")
			
	if player.is_on_floor():
		in_cooldown = false
