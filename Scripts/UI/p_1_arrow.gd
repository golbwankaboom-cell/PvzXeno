extends Sprite2D
# 适用于 Sprite2D, CharacterBody2D, RigidBody2D 等

@export var move_amplitude: float = 5.0  # 移动幅度
@export var move_speed: float = 2.0      # 移动速度
@export var move_vertical: bool = true   # true为上下移动，false为左右移动

var original_position: Vector2
var tween: Tween

func _ready():
	original_position = position
	start_smooth_move()

func start_smooth_move():
	tween = create_tween()
	tween.set_loops()  # 无限循环
	
	if move_vertical:
		# 上下移动
		tween.tween_method(update_vertical_position, -1.0, 1.0, move_speed)
		tween.set_trans(Tween.TRANS_SINE)
		tween.set_ease(Tween.EASE_IN_OUT)
	else:
		# 左右移动
		tween.tween_method(update_horizontal_position, -1.0, 1.0, move_speed)
		tween.set_trans(Tween.TRANS_SINE)
		tween.set_ease(Tween.EASE_IN_OUT)

func update_vertical_position(t: float):
	position.y = original_position.y + sin(t * PI) * move_amplitude

func update_horizontal_position(t: float):
	position.x = original_position.x + sin(t * PI) * move_amplitude

# 可选：暂停/恢复移动
func toggle_movement():
	if tween and tween.is_valid():
		if tween.is_running():
			tween.pause()
		else:
			tween.play()
