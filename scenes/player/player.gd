extends CharacterBody2D
class_name Player

const JUMP_VELOCITY = -530.0
@onready var sprite = $Sprite2D

var speed = 300.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var paused_movement = false

func _ready():
	position = PlayerGlobals.starting_pos
	sprite.flip_h = PlayerGlobals.spawn_facing_right

func _physics_process(delta):
	if not paused_movement:
		# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta
			$AnimationPlayer.play("jump")
		
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
			sprite.flip_h = (direction >= 0)
			
			if is_on_floor():
				$AnimationPlayer.play("running")
		else:
			velocity.x = move_toward(velocity.x, 0, 30)
			
			if is_on_floor():
				$AnimationPlayer.play("idle")
			
		#Execute unlockable abilities, if they're unlocked
		for ability_name in AbilityManager.unlocked_abilities.keys():
			var ability = AbilityManager.unlocked_abilities[ability_name]
			ability.execute(self)

		move_and_slide()
