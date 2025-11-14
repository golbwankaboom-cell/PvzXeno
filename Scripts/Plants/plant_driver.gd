extends Driver
##植物基类
class_name PlantDriver 
##子弹场景
@export var bullet_type			: PackedScene
##攻击计时
@export var attack_timer		: float=1.4
##子弹创建偏移
@export var bullet_position		: Vector2 = Vector2.ZERO 
##子弹初始动量
@export var bullet_velocity		: Vector2 = Vector2(0,0)
##子弹运行速度
@export var bullet_operating_speed : float = 1.0      
##子弹可穿透次数
@export var bullet_durable		: int = 1                
##插件容量
@export var blade_amount		: int = 4
#棋盘行数（初始值为 1）
var board_row = 1
#棋盘列数（初始值为 1）
var board_column = 1
#原始子弹动量
var original_bullet_velocity
#当前速度（向量类型，未初始化）
#var current_velocity
#当前刀片数量（初始值为 0）
var current_blade_amount = 0

#攻击信号（可用于触发攻击相关逻辑）
signal attack_signal

var attack_timer_delta=attack_timer
func _ready():
	current_velocity = bullet_velocity
	original_bullet_velocity = bullet_velocity
func _process(delta):
	attack_timer_delta -= delta * operating_speed
	if attack_timer_delta <= 0:
		attack_timer_delta = attack_timer#更精确
		attack()
		print("attack_timer",str(attack_timer))
		
	#处理死亡
	if health <= 0:
		die()
		
func attack():
	emit_signal("attack_signal")
	#var bullet_position = position
	var bullet : BulletBase = bullet_type.instantiate()
	bullet.position = bullet_position
	bullet.bullet_operating_speed = bullet_operating_speed
	#current_velocity = bullet_velocity
	#print()
	bullet.bullet_velocity = Vector2(600, 0) + bullet_velocity
	print("current_velocity",str(bullet_velocity))
	bullet.bullet_damage = attack_damage
	bullet.bullet_durable = bullet_durable
	add_child(bullet)
	bullet_velocity_reset()
	攻击回调()
func 攻击回调():
	pass#子类覆写
func bullet_velocity_reset():
	bullet_velocity = original_bullet_velocity
	pass
func die():
	deadrattle()

func deadrattle():
	queue_free()

func dig():
	queue_free()##铲除将跳过亡语效果
	
func bladization():
	queue_free()
