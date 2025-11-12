extends Node2D
var parent
var grandparent
var rdmnum

var blade_id = 0
func _enter_tree():
	parent = get_parent()
	grandparent = get_parent().get_parent()
	#parent.bullet_velocity = Vector2(0,200)
	parent.attack_signal.connect(_on_attack_signal)
	
func _on_attack_signal():
		# 先执行子节点效果
		rdmnum = parent.rdmnum
		if rdmnum == 0:
			rdmnum = -1
		if rdmnum == 1:
			rdmnum = 1
		print(parent.bullet_velocity)
		parent.bullet_velocity += rdmnum * Vector2(0,100)
		
func _ready():
	grandparent.current_blade_amount += 1
	blade_id += grandparent.current_blade_amount
	#print(blade_id)
	
	position = Vector2(-40,-60 + 20 * blade_id )
