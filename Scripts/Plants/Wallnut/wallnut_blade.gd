extends Node2D
var parent
var grandparent
var rdmnum
func _enter_tree():
	parent = get_parent()
	grandparent = get_parent().get_parent()
	#parent.bullet_velocity = Vector2(0,200)
	grandparent.attack_signal.connect(_on_attack_signal)
	
func _on_attack_signal():
		# 先执行子节点效果
		rdmnum = grandparent.rdmnum
		if rdmnum == 0:
			rdmnum = -1
		if rdmnum == 1:
			rdmnum = 1
		parent.bullet_velocity += rdmnum * Vector2(0,100)
