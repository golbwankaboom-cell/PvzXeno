extends Node2D
var arrow = preload("res://Scenes/UI/Arrow.tscn").instantiate()

func _ready():
	if ArrowManager.control_type == "controller":
		#print(1)
		arrow.position = Vector2(70,127)
		add_child(arrow)
