extends CharacterBody2D
@onready var animation: AnimatedSprite2D = $Sprite2D
@onready var eyes: AnimatedSprite2D = $Sprite2D/blink
@onready var point_light: PointLight2D = $Pivot/PointLight2D
@onready var click = $click
@onready var steps = $moving

var click_played : bool = false

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _process(delta: float) -> void:
	
	if not Global.battery_dead:
		if Input.is_action_pressed("interact"):
			Global.light += 1
			if not click_played:
				click.play()
			click_played = true
			point_light.show()
		else: 
			point_light.hide()
			click_played = false
	else:
		point_light.hide()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")

	if direction != 0:
		
		if not steps.playing:
			steps.play()
		
		velocity.x = direction * SPEED

		animation.flip_h = direction < 0
		eyes.flip_h = direction < 0

		if animation.animation != "move":
			animation.play("move")
	else:
		
		steps.stop()
		
		velocity.x = move_toward(velocity.x, 0, SPEED)

		if animation.animation != "idle":
			animation.play("idle")

	

	move_and_slide()
