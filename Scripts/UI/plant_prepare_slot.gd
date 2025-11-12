extends Control
##植物准备卡槽
class_name plant_prepare_slot
## 植物卡片：用于在游戏中选择和种植植物的卡片，包含植物相关信息（如阳光消耗、冷却时间等）
var plant_card_scene:plant_card## 变量用于内部加载
## 植物插件：为植物基类提供额外能力的组件,后续开发
#var plant_blade_scene

##暂时先存内部后续可以放到固定位置
var 文件路径="res://Scenes/Plants/plant_scene/"
var 植物场景={
	"peashooter":"plant_001_pea_shooter_single.tscn",#豌豆射手
	"sunflower":"plant_002_sun_flower.tscn"#向日葵
	}
## 植物卡片数组
var plant_card_array: Array[plant_card]
## 植物出战卡片存档(传入)
var plant_battle_card_save=["peashooter","sunflower"]
func _ready():
	##反复数组次
	for i in plant_battle_card_save.size():
		##植物场景
		plant_card_scene =preload("res://Scenes/UI/plant_card.tscn").instantiate()
		plant_card_scene.plant_name=plant_battle_card_save[i]
		##绑定点击种植信号
		var Button_card=plant_card_scene.get_node("Button")
		Button_card.pressed.connect(func():
			SetPlantManager.selected_plant=plant_battle_card_save[i])#植物名称
		
		##加入到植物卡槽
		plant_card_array+=[plant_card_scene]
		%card.add_child(plant_card_scene)
	##设定卡槽尺寸
	$Panel.size=Vector2(85+plant_battle_card_save.size()*50,90)
