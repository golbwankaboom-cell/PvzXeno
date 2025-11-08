extends Node
class_name Driver

# Common driver properties for plants and zombies
@export var operating_speed  : float = 1.0            #运行速度
@export var attack_damage    : int   = 0              #攻击伤害（具体类型可由子类在 inspector 中覆盖）
@export var face_foward      : bool  = true           #面朝前方（布尔值）
@export var health           : float = 100.0          #最大生命值
@export var take_damage_rate : float = 1.0            #受伤倍率
@export var damagable        : bool  = true           #是否可以被伤害

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
