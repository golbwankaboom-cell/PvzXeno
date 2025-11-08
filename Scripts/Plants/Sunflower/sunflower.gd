extends Area2D

func _ready():
	$AnimatedSprite2D.speed_scale = $SunflowerDriver.operating_speed
	$AnimatedSprite2D.play("default")
