extends Area2D

@onready var health = $PeashooterDriver.health
@onready var attack_timer = $PeashooterDriver.attack_timer


func _ready():
	$AnimatedSprite2D.speed_scale = $PeashooterDriver.operating_speed
	$AnimatedSprite2D.play("default")

func _process(delta):
	attack_timer -= delta * $PeashooterDriver.operating_speed
	
	if attack_timer <= 0:
		attack_timer = $PeashooterDriver.attack_timer
		attack()
		
	#处理死亡
	if health <= 0:
		die()
		
func attack():
	#var bullet_position = $".".position
	var bullet = $PeashooterDriver.bullet_type.instantiate()
	bullet.position = $".".position + $PeashooterDriver.bullet_position
	bullet.bullet_velocity = Vector2(10, 0) + $PeashooterDriver.bullet_velocity
	bullet.bullet_damage = $PeashooterDriver.attack_damage
	bullet.bullet_durable = $PeashooterDriver.bullet_durable
	get_parent().add_child(bullet)

func die():
	deadrattle()

func deadrattle():
	queue_free()

func dig():
	queue_free()##铲除将跳过亡语效果
	
func bladization():
	queue_free()
