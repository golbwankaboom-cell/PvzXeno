extends Node
var peashooter
var sunflower
var selected_plant
func _init():
	peashooter = preload("res://Scenes/Plants/plant_001_peashooter.tscn")
	sunflower = preload("res://Scenes/Plants/plant_002_sunflower.tscn")

func _ready():
	selected_plant = peashooter
