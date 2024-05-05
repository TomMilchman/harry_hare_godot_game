extends CharacterBody2D
class_name Player

const JUMP_VELOCITY: float = -530.0
@onready var sprite = $Sprite2D

var speed: float = 300.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var paused_movement: bool = false #Enabled: player cannot move
var disabled_basic_movement: bool = false #Enabled: player can only perform unlocked abilities
var facing_right: bool #Updates each time the player turns
var can_take_damage: bool = true #Used for iframes calculations
var has_jumped: bool = false

func _ready():
	position = PlayerGlobals.starting_pos
	flip_player_to_right_or_left(PlayerGlobals.spawn_facing_right)
	for carrot in get_tree().get_nodes_in_group("carrots"):
		carrot.connect('collected', heal)
	for enemy in get_tree().get_nodes_in_group("enemies"):
		enemy.connect("player_stomped_on_enemy", stomped_on_enemy)

# Input true to flip to the right, false for left
func flip_player_to_right_or_left(is_flip: bool):
	sprite.flip_h = is_flip
	facing_right = is_flip

func _physics_process(delta):
	if not paused_movement:
		if not disabled_basic_movement:
			# Add the gravity.
			if not is_on_floor():
				velocity.y += gravity * delta
				
				if not has_jumped:
					play_animation("jump")
					has_jumped = true
			
			# Allow jump to be released early.
			if Input.is_action_just_released("jump") and velocity.y < 0:
				velocity.y = velocity.y * 0.6
				
			# Handle Jump.
			if Input.is_action_just_pressed("jump") and is_on_floor():
				velocity.y = JUMP_VELOCITY
				
			# Get the input direction and handle the movement/deceleration.
			# As good practice, you should replace UI actions with custom gameplay actions.
			var direction = Input.get_axis("left", "right")
			if direction:
				velocity.x = direction * speed
				flip_player_to_right_or_left(direction >= 0)
				
				if is_on_floor():
					play_animation("running")
					has_jumped = false
			else:
				velocity.x = move_toward(velocity.x, 0, 30)
				
				if is_on_floor():
					play_animation("idle")
					has_jumped = false
		
		#Execute unlockable abilities, if they're unlocked
		for ability_name in AbilityManager.unlocked_abilities:
			var ability = get_node("Abilities/"+ability_name)
			ability.execute(self)

		move_and_slide()
		
func take_damage(damage_amount: int):
	var health_after_damage = PlayerGlobals.current_health - damage_amount
	
	if can_take_damage:
		PlayerGlobals.current_health = clamp(health_after_damage, 0, PlayerGlobals.MAX_HEALTH)
		iframes()
		
		if PlayerGlobals.current_health <= 0:
			die()
			
func heal(heal_amount: int):
	var health_after_heal = PlayerGlobals.current_health + heal_amount
	PlayerGlobals.current_health = clamp(health_after_heal, 0, PlayerGlobals.MAX_HEALTH)

func die():
	paused_movement = true
	$AnimationPlayer.play("death")
	PlayerGlobals.current_health = PlayerGlobals.MAX_HEALTH
	TransitionLayer.transition_to_room(PlayerGlobals.spawn_room_location, PlayerGlobals.spawn_pos, true)

func iframes():
	can_take_damage = false
	
	if (PlayerGlobals.current_health > 0):
		$EffectsPlayer.play("iframes")
		await get_tree().create_timer(1.5).timeout
		$EffectsPlayer.stop()
		can_take_damage = true
	

func stomped_on_enemy():
	velocity.y = JUMP_VELOCITY

func play_animation(animation_name: String):
	$AnimationPlayer.play(animation_name)
