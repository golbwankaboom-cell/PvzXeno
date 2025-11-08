extends Area2D

var mouse_in = false

func _ready():
	$BoardSelector.visible = false

func _on_mouse_entered():
	mouse_in = true
	$BoardSelector.visible = true
	print(self.name)



func _on_mouse_exited():
	mouse_in = false
	$BoardSelector.visible = false
	
	
func _process(delta):
	if mouse_in == true and Input.is_action_just_pressed("mouse_left"):
		set_plant()

func set_plant():
	if mouse_in == true:
		var plant = PlantManager.selected_plant.instantiate()
		plant.position = $".".position
		get_parent().add_child(plant)
