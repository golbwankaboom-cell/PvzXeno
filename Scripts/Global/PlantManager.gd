##植物管理器保存点 PlantManager
extends Node
var plant_scene = {
	##豌豆射手
	"peashooter" = preload("res://Scenes/Plants/Peashooter/peashooter.tscn"),
	##向日葵
	"sunflower" = preload("res://Scenes/Plants/Sunflower/sunflower.tscn")
}
##植物动画场景文件前缀
var anim="res://Scenes/Plants/plant_scene/"
##植物动画场景文件名称字典
var plant_anim={
	"peashooter":"plant_001_pea_shooter_single.tscn",#豌豆射手
	"sunflower":"plant_002_sun_flower.tscn"#向日葵
	}
##植物插件图片字典
var plant_Blade = {
	"blankPlant":preload("res://assets/Images/BladeIcon_blankPlant.png"),#空白植物
	"peashooter":preload("res://assets/Images/BladeIcon_Peashooter.png"),#豌豆射手
	"sunflower":preload("res://assets/Images/BladeIcon_Sunflower.png"),#向日葵
	}
## 查询植物插件图片的函数
func get_plant_image(plant_name: String) -> Texture2D:
	# 检查字典中是否存在该植物名称
	if plant_Blade.has(plant_name):
		return plant_Blade[plant_name]
	else:
		# 找不到时返回第一个元素（blankPlant）
		return plant_Blade.values()[0]
##植物插件方法
var Blade = {
	"blankPlant":PlantBlade,#空白植物
	"peashooter":Blade_peashooter,#豌豆射手
	"sunflower":Blade_sunflower,#向日葵
	}
## 查询植物插件的函数
func get_plant(plant_name: String):
	# 检查字典中是否存在该植物名称
	if Blade.has(plant_name):
		return Blade[plant_name]
	else:
		# 找不到时返回第一个元素（blankPlant）
		return Blade.values()[0]
##目录用于快速定义关联文件,不在代码内使用
@warning_ignore("shadowed_global_identifier")
##植物卡片
var plant_card
