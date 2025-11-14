extends PlantBlade

var original_attack_damage  # 原攻击伤害
var boost : bool = true
	
	
func _process(_delta):
	if grandparent.health >= parent.health and boost == false:
		# 满血且未加成：应用加成
		parent.attack_damage = parent.attack_damage * 2
		boost = true
	elif grandparent.health < parent.health and boost == true:
		# 不满血但已加成：取消加成
		parent.attack_damage = original_attack_damage
		boost = false

func effect():
	# 触发效果
	original_attack_damage = parent.attack_damage
	parent.attack_damage = parent.attack_damage * 2
