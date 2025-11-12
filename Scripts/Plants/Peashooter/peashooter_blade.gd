extends Node2D
var parent
func _enter_tree():
	parent = get_parent()
	parent.operating_speed = parent.operating_speed * 10
