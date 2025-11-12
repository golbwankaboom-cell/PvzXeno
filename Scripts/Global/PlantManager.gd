extends Node
var peashooter
var sunflower
var plant_name 
var plant_scene = {
	
	"peashooter" = preload("res://Scenes/Plants/Peashooter/peashooter.tscn"),
	"sunflower" = preload("res://Scenes/Plants/Sunflower/sunflower.tscn")
	
}
	

func _process(delta):
	plant_name = SetPlantManager.selected_plant
	
	#print(plant_name)
