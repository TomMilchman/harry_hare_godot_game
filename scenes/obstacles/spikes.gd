extends Node2D

@export var damage_amount = PlayerGlobals.MAX_HEALTH

# Called when the node enters the scene tree for the first time.
func _ready():
	$Hitbox.deal_damage.connect(_on_deal_damage_to_player)


func _on_deal_damage_to_player(body):
	if body is Player:
		var player = body as Player
		player.take_damage(damage_amount)
