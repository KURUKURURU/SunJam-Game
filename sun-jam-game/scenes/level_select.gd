extends Node2D
@onready var ting: AudioStreamPlayer = $ting
@onready var animation: AnimationPlayer = $HBoxContainer/animation

@onready var levelbutton: Button = $HBoxContainer/title/levelbutton
@onready var levelbutton_2: Button = $HBoxContainer/title2/levelbutton2
@onready var levelbutton_3: Button = $HBoxContainer/title3/levelbutton3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Ui.hide()
	levelbutton.disabled = false
	
	animation.play("fadeinto")
	
	
	

func _process(delta: float) -> void:
	
	if Global.level_1_complete: levelbutton_2.disabled = false
	else: levelbutton_2.disabled = true
	if Global.level_2_complete: levelbutton_3.disabled = false
	else: levelbutton_3.disabled = true
	
	if Input.is_action_just_pressed("click"):
		ting.play()


func lvl_1() -> void:
	Global.current_level = 1
	Ui.show()
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")

func lvl_2() -> void:
	Global.current_level = 2
	Ui.show()
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")

func lvl_3() -> void:
	Global.current_level = 3
	Ui.show()
	get_tree().change_scene_to_file("res://scenes/level_3.tscn")
