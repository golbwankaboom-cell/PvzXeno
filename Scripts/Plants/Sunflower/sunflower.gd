extends PlantDriver 
@export var anim : AnimationPlayer
func _ready():
	super._ready()#运行上级节点的方法
	anim=$Plant002SunFlower/AnimationPlayer
func 攻击回调():
	
	# 假设原向量是 bullet_velocity（例如 (100, 0)）
	var original_length = bullet_velocity.length()  # 获取原向量的长度（模长）

	# 生成一个随机方向的单位向量
	var random_angle = PI+randf_range(0, PI*2 )  # 随机角度（弧度）
	var random_direction = Vector2(cos(random_angle), sin(random_angle))  # 单位向量

	# 生成与原向量长度相同、方向随机的新向量
	var test = random_direction * original_length
	current_velocity = test
	pass#子类覆写
