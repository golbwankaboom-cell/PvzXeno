extends Area2D

enum ZombieState {
	MOVE,
	ATTACK
}

var state : ZombieState
var damagable : bool

@onready var health = $ZombieDriver.health


func _ready():
	state = ZombieState.MOVE#默认移动态
	$AnimatedSprite2D.play("Move")

func _process(delta):
	damagable = $ZombieDriver.damagable
	
	match state:
		ZombieState.MOVE:
			handle_move(delta)
		ZombieState.ATTACK:
			handle_attack(delta)
			
	#处理死亡
	if health <= 0:
		die()
			
func handle_move(delta):
	position.x -= $ZombieDriver.move_speed * delta
	
func handle_attack(_delta):
	pass


#处理受到伤害
func take_damage(bullet_damage):
	health -= bullet_damage
	
func die():
	create_die_effect()
	queue_free()

func create_die_effect():
	var effect = preload("res://Scenes/Effect/zombie_die_effect.tscn").instantiate() #instantiate这是对的
	effect.position = position
	get_parent().add_child(effect)
