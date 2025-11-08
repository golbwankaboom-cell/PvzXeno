# 豌豆射手逻辑（继承自Area2D）
# 就绪时获取生命值和攻击计时器（来自PeashooterDriver节点）
extends Area2D

@onready var health = $PeashooterDriver.health
@onready var attack_timer = $PeashooterDriver.attack_timer


# 就绪时设置动画速度为驱动脚本的运行速度，并播放默认动画
#func _ready():


# 每帧更新：根据运行速度减少攻击计时器，计时结束时执行攻击；检查生命值，为0则执行死亡
func _process(delta):
	attack_timer -= delta * $PeashooterDriver.operating_speed
	
	if attack_timer <= 0:
		attack_timer = $PeashooterDriver.attack_timer
		attack()
		
	#处理死亡
	if health <= 0:
		die()
		
# 攻击逻辑：实例化子弹，设置子弹位置、速度、伤害和耐久度，添加到父节点
func attack():
	#var bullet_position = $".".position
	var bullet = $PeashooterDriver.bullet_type.instantiate()
	bullet.position = $".".position + $PeashooterDriver.bullet_position
	bullet.bullet_velocity = Vector2(10, 0) + $PeashooterDriver.bullet_velocity
	bullet.bullet_damage = $PeashooterDriver.attack_damage
	bullet.bullet_durable = $PeashooterDriver.bullet_durable
	get_parent().add_child(bullet)

# 死亡逻辑：调用亡语
func die():
	deadrattle()

# 亡语逻辑：释放自身
func deadrattle():
	queue_free()

# 铲子逻辑：直接释放自身，跳过亡语效果
func dig():
	queue_free()##铲除将跳过亡语效果
	
# bladization逻辑：释放自身
func bladization():
	queue_free()
