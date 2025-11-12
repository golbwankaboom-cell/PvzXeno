extends BulletBase

func _ready():
	print(bullet_velocity)

#实现移动
func _process(delta):
	move(delta)

#实现伤害
func _on_area_entered(area):
	if attackable == false:
		return
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
	#实现子弹销毁
	if bullet_durable <= 0:
		queue_free()


func create_bullet_pea_effect():
	var effect = preload("res://Scenes/Effect/bullet_pea_effect.tscn").instantiate() #instantiate这是对的
	effect.position = position
	get_parent().add_child(effect)
	
func move(delta):
	position += bullet_velocity * delta * bullet_operating_speed
	
