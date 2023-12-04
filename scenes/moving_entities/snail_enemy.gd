extends MovingEntity

func _on_animatable_body_2d_player_stomped_on_enemy():
	$AnimationPlayer.pause()
	$AnimatableBody2D/EnemyAnimationPlayer.play("death")
