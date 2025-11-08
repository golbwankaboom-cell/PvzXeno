extends Area2D
#子弹默认属性

var bullet_velocity = Vector2(0,0) #子弹初始动量
var bullet_operating_speed = 1 #子弹运行速度
var bullet_durable = 1 #子弹可穿透次数
var bullet_damage = 25
var attackable = false

#实现移动
func _process(delta):
	$".".position += bullet_velocity
