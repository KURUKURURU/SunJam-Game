extends StaticBody2D
@onready var animation: AnimationPlayer = $animation


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func fade():
	animation.play("fade")
	await animation.animation_finished
	queue_free()
