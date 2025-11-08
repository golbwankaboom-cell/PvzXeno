extends Node2D

@export var board_scene : PackedScene    #关联场景
@export var board_size : Vector2 = Vector2(80, 100)  # 每个格子的尺寸
@export var spacing : Vector2 = Vector2(0, 0)    # 格子间距

var n = 5
var m = 9

func _ready():
	generate_grid(n, m)
	

func generate_grid(n: int, m: int):
	# 计算总尺寸
	var total_width = m * (board_size.x + spacing.x) - spacing.x
	var total_height = n * (board_size.y + spacing.y) - spacing.y
	
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
			
			# 计算位置
			board.position = start_pos + Vector2(
				column * (board_size.x + spacing.x),
				row * (board_size.y + spacing.y)
			)

	
