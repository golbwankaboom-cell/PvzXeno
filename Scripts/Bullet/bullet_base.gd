extends Area2D
class_name BulletBase

var bullet_velocity : Vector2 = Vector2(0,0) #子弹初始动量
var bullet_operating_speed : float = 1.0 #子弹运行速度
var bullet_durable : int = 1 #子弹可穿透次数
var bullet_damage : int = 20 #子弹伤害值
var attackable : bool = true #是否可以攻击敌人
var friendly_fire : bool = false #是否可以攻击队友

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
