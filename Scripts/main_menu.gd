extends Control
var selected_level = ("res://Scenes/Level/lawn.tscn")

func _process(delta):
	if $BG/AdventureButton.button_pressed:
		adventure()
		
func adventure():
	get_tree().change_scene_to_file(selected_level)
