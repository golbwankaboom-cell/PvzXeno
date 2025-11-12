extends Node2D

var parent
var grandparent
var original_attack_damage
var boost
var blade_id
func _enter_tree():
	parent = get_parent()
	grandparent = get_parent().get_parent()
	original_attack_damage = parent.attack_damage
	parent.attack_damage = parent.attack_damage * 2
	boost = true
	
	
func _process(delta):
	if grandparent.health >= parent.health and boost == false:
		# 满血且未加成：应用加成
		parent.attack_damage = parent.attack_damage * 2
		boost = true
	elif grandparent.health < parent.health and boost == true:
		# 不满血但已加成：取消加成
			parent.attack_damage = original_attack_damage
			boost = false

func _ready():
	grandparent.current_blade_amount += 1
	blade_id += grandparent.current_blade_amount
	#print(blade_id)
	
	position = Vector2(-40,-60 + 20 * blade_id )
