extends Node2D
var operating_speed = 1 #运行速度
var attack_timer = 1.4 #攻击速度
var attack_damage = 20 #攻击伤害
var bullet_type = BulletManager.bullet_pea
var bullet_position = Vector2.ZERO #子弹创建偏移
var bullet_velocity = Vector2(0,0) #子弹初始动量（豌豆射手发射子弹的时候其实还会给动量）
var bullet_operating_speed = 1 #子弹运行速度
var bullet_durable = 1 #子弹可穿透次数
var face_foward = true #面朝前方（布尔值）
var health = 300#最大生命值
var take_damage_rate = 1 #受伤倍率
