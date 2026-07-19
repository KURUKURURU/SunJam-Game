extends Node2D
@onready var img: AnimatedSprite2D = $img
@onready var spray: AudioStreamPlayer2D = $"../spray"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	
	if img:
		if Input.is_action_pressed("click"):
			if not spray.playing:
				spray.play()
			
			img.play("hold")
		else: 
			img.play("release")
			spray.stop()
