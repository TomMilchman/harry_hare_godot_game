extends Area2D

signal enemy_damaged


func _on_area_entered(area):
	if area is PlayerFeetHitbox:
		var feet_hitbox = area as PlayerFeetHitbox
		enemy_damaged.emit()
