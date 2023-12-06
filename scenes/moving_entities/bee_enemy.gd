extends MovingEnemy

func _on_player_stomped_on_enemy():
	queue_free()
