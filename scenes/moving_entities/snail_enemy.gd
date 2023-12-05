extends MovingEnemy

func _on_player_stomped_on_enemy():
	$AnimationPlayer.pause()
	$AnimatableBody2D/EnemyAnimationPlayer.play("death")
