extends AnimatableBody2D

signal player_stomped_on_enemy

@export var damage_amount: int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$EnemyHitbox.deal_damage.connect(_on_deal_damage_to_player)
	$EnemyHurtbox.enemy_damaged.connect(_on_enemy_damaged)

func _on_deal_damage_to_player(body):
	if body is Player:
		var player = body as Player
		player.take_damage(damage_amount)

func _on_enemy_damaged():
	$EnemyHitbox.queue_free()
	$EnemyHurtbox.queue_free()
	player_stomped_on_enemy.emit()
