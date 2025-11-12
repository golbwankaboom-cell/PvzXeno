extends PlantDriver 
#@export var anim : Node2D
#
#func _ready():
	#anim=$Plant002SunFlower
	#pass


func _process(delta):
	
	attack_timer -= delta * operating_speed
	
	
	
	if attack_timer <= 0:
		attack_timer = attack_timer
		attack()
		
		
	#处理死亡
	if health <= 0:
		die()
		
func attack():
	var bullet = bullet_type.instantiate()
	bullet.position = position
	bullet.bullet_operating_speed = bullet_operating_speed
	bullet.bullet_velocity = Vector2(0, 15) + bullet_velocity
	if face_foward == false:
		bullet.bullet_velocity = -bullet.bullet_velocity
	bullet.bullet_damage = attack_damage
	bullet.bullet_durable = bullet_durable
	get_parent().add_child(bullet)
	

func die():
	deadrattle()

func deadrattle():
	queue_free()

func dig():
	queue_free()##铲除将跳过亡语效果
	
func bladization():
	queue_free()
