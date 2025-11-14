extends Node2D
class_name PlantBlade

var parent : Node2D
var grandparent : Node2D
var blade_id : int = 0
func _enter_tree():
	parent = get_parent()
	grandparent = get_parent().get_parent()
	parent.operating_speed = parent.operating_speed * 2
	
func _ready():
	grandparent.current_blade_amount += 1
	blade_id = grandparent.current_blade_amount
	#print(blade_id)
	
	position = Vector2(-40, -60 + 20 * blade_id)

func effect():
	pass
