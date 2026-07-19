extends Node2D
@onready var intro: Node2D = $intro
@onready var ting: AudioStreamPlayer = $ting


func _ready() -> void:
	intro.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		ting.play()


func _on_question_pressed() -> void:
	match intro.visible:
		true: intro.hide()
		false: intro.show()


func _on_start_pressed() -> void:
	pass # Replace with function body.
