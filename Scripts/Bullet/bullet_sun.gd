extends BulletBase
#子弹默认属性

# var bullet_velocity = Vector2(0,0) #子弹初始动量
# var bullet_operating_speed = 1 #子弹运行速度
# var bullet_durable = 1 #子弹可穿透次数
# var bullet_damage = 25
# var attackable = false

func _ready() -> void:
	$AnimatedSprite2D.play("default")
	# 创建计时器节点
	var timer = Timer.new()
	# 添加到当前节点（作为子节点）
	add_child(timer)
	# 设置计时时间为5秒
	timer.wait_time = 5.0
	# 设置只触发一次
	timer.one_shot = true
	# 连接超时信号到删除自身的函数
	timer.timeout.connect(self.queue_free)
	# 启动计时器
	timer.start()
	

var 计数器=0
func _process(delta):
	move(delta)

func move(delta):
	计数器+=delta
	# 处理X速度：每秒降低1，最低为0（停下）
	if 计数器 < 2:
		bullet_velocity.x = bullet_velocity.x - (bullet_velocity.x * delta*10)
		if bullet_velocity.y<50:
			if bullet_velocity.y<50:
				bullet_velocity.y=bullet_velocity.y - (bullet_velocity.y * delta*2)
			bullet_velocity.y += 10
		else :
			bullet_velocity.y = 50
	else :
		bullet_velocity=Vector2(0,0)
	# 应用最终速度到位置
	position += bullet_velocity * delta * bullet_operating_speed
	
