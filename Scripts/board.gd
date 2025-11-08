extends Area2D

#var mouse_in = false
#var control_type = "mouse"
var arrow_in = false

var board_row = 1
var board_column = 1

var has_plant = false

var current_plant = null 

signal plant_planted(plant_instance, board_position)

func _ready():
	$BoardSelector.visible = false
	



func _on_mouse_entered():
	if ArrowManager.control_type == "mouse":
		arrow_entered()

func arrow_entered():
	arrow_in = true
	$BoardSelector.visible = true
	ArrowManager.current_board_position = global_position



func _on_mouse_exited():
	if ArrowManager.control_type == "mouse":
		arrow_exited()
	
func arrow_exited():
	
		arrow_in = false
		$BoardSelector.visible = false
	
	
func _process(delta):
	if arrow_in == true and Input.is_action_just_pressed("mouse_left"):
		set_plant()
		
	if arrow_in == true and Input.is_action_just_pressed("controller_a"):
		set_plant()

func set_plant():
	if arrow_in == true and not has_plant:
		var plant = PlantManager.selected_plant.instantiate()
		plant.position = position
		plant.board_row = board_row
		plant.board_column = board_column
		get_parent().add_child(plant)
		has_plant = true
		current_plant = plant
		
		plant_planted.emit(plant, Vector2(board_row, board_column))
		print(Vector2(board_row, board_column))
		
		
		print(current_plant)


func _on_area_entered(area):
	if area.is_in_group("Arrow"):
		if ArrowManager.control_type == "controller":
			arrow_entered()



func _on_area_exited(area):
	if area.is_in_group("Arrow"):
		if ArrowManager.control_type == "controller":
			arrow_exited()
