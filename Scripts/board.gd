extends Control
##interaction_area_node#交互区：鼠标判定区域


#var mouse_in = false
#var control_type = "mouse"
var arrow_in = false

var board_row = 1
var board_column = 1

var has_plant = false

var current_plant = null 

signal plant_planted(plant_instance, board_position)

func _ready():
	ArrowManager.cursor_moved.connect(arrow_exited)
	$BoardSelector.visible = false
func arrow_entered():
	ArrowManager.emit_signal("cursor_moved",self)
func arrow_exited(node):#解除
	if not node==self:
		arrow_in = false
		$BoardSelector.visible = false
	else :
		arrow_in = true
		$BoardSelector.visible = true
		var self_world_position = global_position# 获取当前节点的世界坐标
		ArrowManager.current_board_position = global_position
		if ArrowManager and ArrowManager.cursor_pointer:# 将cursor_pointer节点移动到当前节点的世界坐标
			ArrowManager.cursor_pointer.global_position = self_world_position
## 种植命令：执行植物种植操作的方法
func plant_command(event):
	# 判断是否是鼠标左键按下事件
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		arrow_entered()#选择当前格子
		try_set_plant()#种植判断

func _process(_delta):
	#if arrow_in == true and Input.is_action_just_pressed("mouse_left"):
		#try_set_plant()
	if arrow_in == true and Input.is_action_just_pressed("controller_a"):
		try_set_plant()
# 种植植物的函数
# 功能：当箭头在当前区域内且该位置未种植植物时，实例化选中的植物并完成种植流程
# 流程说明：
# 1. 检查条件：箭头是否在范围内（arrow_in为true）且当前位置无植物（not has_plant）
# 2. 实例化植物：通过植物管理器（PlantManager）获取选中的植物并实例化
# 3. 配置植物属性：设置植物位置为当前节点位置，记录其所在的棋盘行（board_row）和列（board_column）
# 4. 添加到场景：将实例化的植物添加到当前节点的父节点中（使其在场景中显示）
# 5. 更新状态：标记当前位置已种植植物（has_plant设为true），保存当前种植的植物实例（current_plant）
# 6. 发送信号：发射plant_planted信号，携带植物实例和其所在行列的向量信息（供其他逻辑响应）
# 7. 调试输出：打印植物所在行列的向量及当前种植的植物实例（用于开发调试）
func try_set_plant():#种植条件检查
	if arrow_in == true and not has_plant:
		set_plant()
	else :
		set_plant_failed()
		
func set_plant():
		var plant_name = SetPlantManager.selected_plant
		#print("种植",plant_name)
		var plant = PlantManager.plant_scene[plant_name].instantiate()
		plant.position = position
		plant.board_row = board_row
		plant.board_column = board_column
		get_parent().add_child(plant)
		has_plant = true
		#current_plant = plant
		
		plant_planted.emit(plant, Vector2(board_row, board_column))
		#print(Vector2(board_row, board_column))
		
		
		#print(current_plant)
		#print(PlantManager.selected_plant)

			
func set_plant_failed():
	pass
