extends Area2D
#子弹默认属性

var bullet_velocity = Vector2(0,0) #子弹初始动量
var bullet_operating_speed = 1 #子弹运行速度
var bullet_durable = 1 #子弹可穿透次数
var bullet_damage = 20
var attackable = true
var friendly_fire = false




func _ready():
	area_entered.connect(_on_area_entered)

#实现移动
func _process(delta):
	$".".position += bullet_velocity
	
	#实现子弹销毁
	if bullet_durable <= 0:
		queue_free()

#实现伤害
func _on_area_entered(area):
	if attackable == true:
		if area.has_method("take_damage") and area.damagable == true:
			if friendly_fire == true:
				attack()
			else:
				if area.is_in_group("Zombie"):
					area.take_damage(bullet_damage)
					attack()
			
func attack():
	create_bullet_pea_effect()##播放视觉效果
	bullet_durable -= 1


func create_bullet_pea_effect():
	var effect = preload("res://Scenes/Effect/bullet_pea_effect.tscn").instantiate()
	effect.position = $".".position
	get_parent().add_child(effect)
