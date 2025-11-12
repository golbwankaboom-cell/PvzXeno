extends Area2D
## 移动状态枚举：包含 idle（闲置）、slow_move（慢速移动）、fast_move（快速移动）、return（返回）状态
enum MovementState { IDLE, SLOW_MOVE, FAST_MOVE, RETURN }
## 慢速速度
@export var slow_speed: float = 500.0
## 快速速度
@export var fast_speed: float = 800.0
## 返回速度
@export var return_speed: float = 1200.0
## 死区范围
@export var dead_zone: float = 0.2
## 快速阈值
@export var fast_threshold: float = 0.9
## 返回距离
@export var return_distance: float = 20

## 速度向量
var velocity: Vector2 = Vector2.ZERO
## 当前状态
var current_state: MovementState = MovementState.IDLE
func _ready():
	ArrowManager.cursor_pointer=self
func _process(delta):
	var input_vector = Vector2(
		Input.get_axis("ls_left", "ls_right"),
		Input.get_axis("ls_up", "ls_down")
	)
	update_state(input_vector)
	apply_movement(input_vector, delta)
	position += velocity * delta
	# 使用clamp限制位置在范围内
	position.x = clamp(position.x, ArrowManager.min_position.x, ArrowManager.max_position.x)
	position.y = clamp(position.y, ArrowManager.min_position.y, ArrowManager.max_position.y)
	var x_distance = abs(position.x - ArrowManager.current_board_position.x)
	var y_distance = abs(position.y - ArrowManager.current_board_position.y)
	# 判断条件：X距离>70 且 Y距离<100（若Y100是其他条件可修改比较符号）
	if x_distance > 70 or y_distance > 100:
		# 发出信号并传递最近的地块节点
		print("发出一次更新信号")
		ArrowManager.emit_signal("cursor_moved", get_closest_plot())

func update_state(input_vector: Vector2):
	var input_strength = input_vector.length()
	var new_state: MovementState
	if input_strength > dead_zone:
		if input_strength > fast_threshold:
			new_state = MovementState.FAST_MOVE
		else:
			new_state = MovementState.SLOW_MOVE
	else:
		# 无输入时，如果有目标位置则立即返回
		if ArrowManager and ArrowManager.current_board_position != Vector2.ZERO:
			new_state = MovementState.RETURN
			
			
		else:
			new_state = MovementState.IDLE
	
	if new_state != current_state:
		current_state = new_state
		on_state_transition()

func apply_movement(input_vector: Vector2, delta: float):
	match current_state:
		MovementState.IDLE:
			velocity = Vector2.ZERO
		MovementState.SLOW_MOVE:
			velocity = input_vector.normalized() * slow_speed
		MovementState.FAST_MOVE:
			velocity = input_vector.normalized() * fast_speed
		MovementState.RETURN:
			move_to_board_position(delta)

func move_to_board_position(delta: float):
	if ArrowManager and ArrowManager.current_board_position != Vector2.ZERO:
		var target_position = ArrowManager.current_board_position
		var direction = (target_position - position).normalized()
		var distance = position.distance_to(target_position)
		
		if distance < return_speed * delta:
			position = target_position
			velocity = Vector2.ZERO
			if current_state == MovementState.RETURN:
				current_state = MovementState.IDLE
				on_state_transition()
		else:
			velocity = direction * return_speed
	else:
		velocity = Vector2.ZERO

func on_state_transition():
	#print("状态切换到: ", MovementState.keys()[current_state])
	pass
# 获取最近地块
# 计算当前节点世界坐标与地块数组中最接近的节点并返回（节点为网格排列）
func get_closest_plot() :
	if ArrowManager.plot_parent_node.plot_array.size()<0:
		return null  # 若地块数组为空，返回空
	
	var current_global_pos = global_position  # 当前节点的世界坐标
	var closest_node = null
	var min_distance_squared = INF  # 使用平方距离避免开方运算，提高效率
	
	for node in ArrowManager.plot_parent_node.plot_array:
		# 计算当前节点与数组中节点的世界坐标平方距离
		var distance_squared = current_global_pos.distance_squared_to(node.global_position)
		# 更新最近节点
		if distance_squared < min_distance_squared:
			min_distance_squared = distance_squared
			closest_node = node
	
	return closest_node
