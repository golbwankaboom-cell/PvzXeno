extends Node2D
var arrow = preload("res://Scenes/UI/Arrow.tscn").instantiate()

func _ready():
	if ArrowManager.control_type == "controller":
		print(1)
		arrow.position = Vector2(300,300)
		add_child(arrow)
