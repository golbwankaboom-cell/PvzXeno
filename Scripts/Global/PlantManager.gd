extends Node
var peashooter
var sunflower
var selected_plant
func _init():
	peashooter = preload("res://Scenes/Plants/peashooter.tscn")
	sunflower = preload("res://Scenes/Plants/sunflower.tscn")

func _ready():
	selected_plant = peashooter
