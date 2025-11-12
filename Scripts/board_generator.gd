extends Node2D

@export var board_scene : PackedScene    #关联场景
@export var board_size : Vector2 = Vector2(80, 100)  # 每个格子的尺寸
@export var spacing : Vector2 = Vector2(0, 0)    # 格子间距
## 地块数组
var plot_array=[]

var n = 5
var m = 9
var total_width
var total_height

func _ready():
	generate_grid(n, m)
	ArrowManager.plot_parent_node=self
	plot_array[0].arrow_entered()

func generate_grid(_n: int, _m: int):
	n=_n#排Y我觉得相同变量还是保持一致好
	m=_m#行X
	# 计算总尺寸
	total_width = m * (board_size.x + spacing.x) - spacing.x
	total_height = n * (board_size.y + spacing.y) - spacing.y
	
	#计算clamp范围
	ArrowManager.min_position = Vector2(position.x-40+5,position.y-50+5)
	ArrowManager.max_position = Vector2(position.x-40-5+total_width,position.y-50-5+total_height)
	#print(ArrowManager.min_position)
	#print(ArrowManager.max_position)
	
	# 计算起始位置（居中显示）
	var start_pos = Vector2.ZERO
	
	# 生成网格
	for row in n:
		for column in m:
			var board = board_scene.instantiate()
			# 设置节点名称格式为 _行_列（从1开始计数）
			board.name = "Cell_%d_%d" % [row + 1, column + 1]
			board.board_row += row
			board.board_column += column
			add_child(board)
			plot_array+=[board]
			# 计算位置
			board.position = start_pos + Vector2(
				column * (board_size.x + spacing.x),
				row * (board_size.y + spacing.y)
			)

	
