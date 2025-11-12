extends Node2D
var 配置文件={"自动播放"=false}
var arrow = preload("res://Scenes/UI/Arrow.tscn").instantiate()
## 植物准备卡槽
var plant_prepare_slot
func _ready():
	$AudioStreamPlayer.playing=配置文件["自动播放"]
	plant_prepare_slot=$plant_prepare_slot
	#if ArrowManager.control_type == "controller":
		#print(1)
	arrow.position = Vector2(70,127)
	add_child(arrow)
