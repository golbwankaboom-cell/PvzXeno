##光标管理器ArrowManager
extends Node
var current_board_position = Vector2(100,100)
#var control_type = "controller"#"mouse"#取消输入控制限制
#var control_type = "controller"
#func _process(delta):
	#print(current_board_position)
var min_position = Vector2.ZERO
var max_position = Vector2.ZERO
## 光标指针
var cursor_pointer
## 地块父节点
var plot_parent_node
## 光标移动信号：当光标移动时发出，携带节点信息
@warning_ignore("unused_signal")
signal cursor_moved(node)
#func _ready():
	#print(min_position," , ", max_position)
