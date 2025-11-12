extends Node
class_name plant_card
##这里新建类只为获取固定数据等数据有固定存储位置需要改
var code=plant_prepare_slot.new()
##植物名称
var plant_name=""

## 植物场景路径：植物场景文件所在的路径标识
var plant_scene_path:String
func _ready():
	if plant_name in code.植物场景:
		plant_scene_path=code.文件路径+code.植物场景[plant_name]
	else :
		print("报错:缺失植物名称或植物场景不存在:",plant_name)
	var plant_scene = load(plant_scene_path).instantiate()
	##加入到植物卡槽
	%anchor.add_child(plant_scene)
