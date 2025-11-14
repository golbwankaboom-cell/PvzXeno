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
##目录用于快速定义关联文件,不在代码内使用
@warning_ignore("shadowed_global_identifier")
##植物卡片
var plant_card
