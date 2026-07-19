extends Node2D
@onready var player: CharacterBody2D = $Player
@onready var border: Area2D = $Border
@onready var death: AudioStreamPlayer = $death
@onready var animation: AnimationPlayer = $the_horror/animation
@onready var last_bed_hitbox: Area2D = $LastBed/Area2D

var start_position : Vector2

var foam_particle = preload("res://scenes/foam.tscn")

var limit := 0 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_position = player.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if limit < 30 and not Global.ran_out:
		if Input.is_action_pressed("click"):
			Global.foam += 1
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


func _on_border_body_entered(body: Node2D) -> void:
	if body == player:
		Ui.reset()
		player.position = start_position
		animation.play("scare")
		death.play()


func last_bed_met(body: Node2D) -> void:
	if body == player:
		Ui.reset()
		Ui.win.play()
		match Global.current_level:
			1: Global.level_1_complete = true
			2: Global.level_2_complete = true
			3: 
				pass # finish the game
		get_tree().change_scene_to_file("res://scenes/level_select.tscn")
