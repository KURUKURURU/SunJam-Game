extends CharacterBody2D
@onready var animation: AnimatedSprite2D = $Sprite2D
@onready var eyes: AnimatedSprite2D = $Sprite2D/blink


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


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
		velocity.x = direction * SPEED

		animation.flip_h = direction < 0
		eyes.flip_h = direction < 0

		if animation.animation != "move":
			animation.play("move")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

		if animation.animation != "idle":
			animation.play("idle")

	

	move_and_slide()
