extends Node
var peashooter
var sunflower
var selected_plant
func _init():
	peashooter = preload("res://Scenes/Plants/Peashooter/peashooter.tscn")
	sunflower = preload("res://Scenes/Plants/Sunflower/sunflower.tscn")

func _ready():
	selected_plant = peashooter
