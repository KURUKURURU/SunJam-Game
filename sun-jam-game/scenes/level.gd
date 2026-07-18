extends Node2D


var foam_particle = preload("res://scenes/foam.tscn")

var limit := 0 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if limit < 20:
		if Input.is_action_pressed("click"):
			var particle = foam_particle.instantiate()
			particle.position = Vector2(get_global_mouse_position())
			particle.position.x = particle.position.x - randi_range(0, 10)
			particle.rotation = randi_range(-180, 180)
			
			var rand_scale = randf_range(1.0, 1.25)
			
			particle.scale = Vector2(rand_scale, rand_scale)
			add_child(particle)
			await particle.fade()
			limit += 1
	else:
		#print(limit)
		Input.action_release("click")
		limit = 0 
