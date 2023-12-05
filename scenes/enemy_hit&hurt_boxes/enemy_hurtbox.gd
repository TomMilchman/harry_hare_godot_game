extends Area2D

signal enemy_damaged

func _on_area_entered(area):
	if area is PlayerFeetHitbox:
		var player_feet_hitbox_collision_shape = area.get_node("CollisionShape2D")
		var enemy_hurtbox_collision_shape = $CollisionShape2D
		
		if player_feet_hitbox_collision_shape.global_position.y <  enemy_hurtbox_collision_shape.global_position.y:
			enemy_damaged.emit()
