extends Driver
class_name PlantDriver 

# var operating_speed  : float    = 1 #运行速度
# var attack_timer     : float    = 1.4 #攻击速度
# var attack_damage    : int      = 20 #攻击伤害
# var bullet_type      : Resource = BulletManager.bullet_pea #子弹类型
# var bullet_position  : Vector2  = Vector2.ZERO #子弹创建偏移
# var bullet_velocity  : Vector2  = Vector2(0,0) #子弹初始动量（豌豆射手发射子弹的时候其实还会给动量）
# var bullet_operating_speed : float = 1 #子弹运行速度
# var bullet_durable   : int = 1 #子弹可穿透次数
# var face_foward      : bool = true #面朝前方（布尔值）
# var health           : int = 300#最大生命值
# var take_damage_rate : float = 1 #受伤倍率


#@export var operating_speed  : float = 1.0            #运行速度
@export var attack_timer     : float                  #攻击速度
#@export var attack_damage    : int                    #攻击伤害
@export var bullet_type              : PackedScene            #子弹类型
@export var bullet_position  : Vector2 = Vector2.ZERO #子弹创建偏移
@export var bullet_velocity  : Vector2 = Vector2.ZERO #子弹初始动量（豌豆射手发射子弹的时候其实还会给动量）
@export var bullet_operating_speed : float = 1.0      #子弹运行速度
@export var bullet_durable   : int = 1                #子弹可穿透次数
# @export var face_foward      : bool = true            #面朝前方（布尔值）
# @export var health           : float = 300.0          #最大生命值
# @export var take_damage_rate : float = 1.0            #受伤倍率
