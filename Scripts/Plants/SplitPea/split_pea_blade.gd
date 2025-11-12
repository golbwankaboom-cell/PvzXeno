extends Node2D
var parent
var grandparent
var blade_id = 0
func _enter_tree():
	parent = get_parent()
	grandparent = get_parent().get_parent()
	parent.face_foward = false
	
func _ready():
	grandparent.current_blade_amount += 1
	blade_id += grandparent.current_blade_amount
	print(blade_id)
