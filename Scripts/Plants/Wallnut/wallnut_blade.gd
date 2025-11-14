extends PlantBlade

var rdmnum : int


func _on_attack_signal():
		# 先执行子节点效果
		#rdmnum = parent.rdmnum
		rdmnum = randi_range(0, 1) * 2 - 1
		print(parent.bullet_velocity)
		parent.bullet_velocity += rdmnum * Vector2(0,100)

func effect():
	parent.attack_signal.connect(_on_attack_signal)