extends PlantBlade

func effect():
	parent.operating_speed = parent.operating_speed * 2


# var parent
# var grandparent
# var blade_id = 0
# func _enter_tree():
# 	parent = get_parent()
# 	grandparent = get_parent().get_parent()
# 	parent.operating_speed = parent.operating_speed * 2
	
# func _ready():
# 	grandparent.current_blade_amount += 1
# 	blade_id = grandparent.current_blade_amount
# 	#print(blade_id)
	
# 	position = Vector2(-40,-60 + 20 * blade_id )
