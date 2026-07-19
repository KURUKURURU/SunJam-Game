extends CanvasLayer
@onready var foam: TextureProgressBar = $Foam
@onready var light: TextureProgressBar = $Light
@onready var label: Label = $Label
@onready var label_2: Label = $Label2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	foam.max_value = 500
	foam.value = 500


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Global.foam > 500:
		Global.ran_out = true
		
	foam.value = 500 - Global.foam
	
	if Global.light > 2000:
		Global.battery_dead = true
		
	light.value = 2000 - Global.light
