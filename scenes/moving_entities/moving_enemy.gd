extends MovingEntity
class_name MovingEnemy

signal player_stomped_on_enemy

@export var damage_amount: int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	
	$AnimatableBody2D/EnemyHitbox.deal_damage.connect(_on_deal_damage_to_player)
	$AnimatableBody2D/EnemyHurtbox.enemy_damaged.connect(_on_enemy_damaged)

func _on_deal_damage_to_player(body):
	if body is Player:
		var player = body as Player
		player.take_damage(damage_amount)

func _on_enemy_damaged():
	$AnimatableBody2D/EnemyHitbox.queue_free()
	$AnimatableBody2D/EnemyHurtbox.queue_free()
	player_stomped_on_enemy.emit()
