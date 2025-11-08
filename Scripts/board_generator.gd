extends Node2D

@export var board_scene : PackedScene    #关联场景
@export var board_size : Vector2 = Vector2(80, 100)  # 每个格子的尺寸
@export var spacing : Vector2 = Vector2(0, 0)    # 格子间距

var ui_layer : Control
var n_input : LineEdit
var m_input : LineEdit
var confirm_btn : Button
var n = 9
var m = 5

func _ready():
	generate_grid(n, m)

#func setup_ui():
	## 创建UI界面
	#ui_layer = Control.new()
	#add_child(ui_layer)
	#
	## 创建输入框
	#n_input = LineEdit.new()
	#n_input.placeholder_text = "输入行数 (n)"
	#n_input.position = Vector2(200, 200)
	#n_input.custom_minimum_size = Vector2(150, 30)
	#
	#m_input = LineEdit.new()
	#m_input.placeholder_text = "输入列数 (m)" 
	#m_input.position = Vector2(200, 250)
	#m_input.custom_minimum_size = Vector2(150, 30)
	#
	## 确认按钮
	#confirm_btn = Button.new()
	#confirm_btn.text = "生成矩阵"
	#confirm_btn.position = Vector2(200, 300)
	#confirm_btn.pressed.connect(_on_confirm_pressed)
	#
	#ui_layer.add_child(n_input)
	#ui_layer.add_child(m_input)
	#ui_layer.add_child(confirm_btn)
#
#func _on_confirm_pressed():
	## 验证输入有效性
	#if n_input.text.is_valid_int() and m_input.text.is_valid_int():
		#var n = n_input.text.to_int()
		#var m = m_input.text.to_int()
		#
		#if n > 0 and m > 0:
			#generate_grid(n, m)
			#ui_layer.queue_free()  # 移除UI界面
		#else:
			#show_error("请输入大于0的整数")
	#else:
		#show_error("请输入有效数字")
#
#func show_error(msg: String):
	#var error_label = Label.new()
	#error_label.text = msg
	#error_label.position = Vector2(200, 350)
	#error_label.modulate = Color.RED
	#ui_layer.add_child(error_label)
	

func generate_grid(n: int, m: int):
	# 计算总尺寸
	var total_width = m * (board_size.x + spacing.x) - spacing.x
	var total_height = n * (board_size.y + spacing.y) - spacing.y
	
	# 计算起始位置（居中显示）
	var start_pos = Vector2.ZERO
	
	# 生成网格
	for row in n:
		for column in m:
			var item = board_scene.instantiate()
			# 设置节点名称格式为 _行_列（从1开始计数）
			item.name = "Cell_%d_%d" % [row + 1, column + 1]
			add_child(item)
			
			# 计算位置
			item.position = start_pos + Vector2(
				row * (board_size.x + spacing.x),
				column * (board_size.y + spacing.y)
			)

	
