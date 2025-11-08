extends Node2D
var timer = 0.2
func _ready():
	$AnimatedSprite2D.play("Die")




func _on_animated_sprite_2d_animation_finished():
	queue_free()
