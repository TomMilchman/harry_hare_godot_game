extends MovingEnemy

func _on_player_stomped_on_enemy():
	flip_on_turn = false
	$AnimationPlayer.pause()
	$AnimatableBody2D/EnemyAnimationPlayer.play("death")
