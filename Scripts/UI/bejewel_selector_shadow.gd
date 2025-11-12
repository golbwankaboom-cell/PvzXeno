extends Sprite2D
# 适用于 Sprite2D, CharacterBody2D, RigidBody2D 等

@export var move_amplitude: float = 1.0  # 缩放幅度
@export var move_speed: float = 2.0      # 缩放速度
@export var move_vertical: bool = true   # 保留参数但不使用，为了兼容性

var original_scale: Vector2
var tween: Tween

func _ready():
	original_scale = scale
	start_smooth_scale()

func start_smooth_scale():
	tween = create_tween()
	tween.set_loops()  # 无限循环
	
	# 大小缩放动画
	tween.tween_method(update_scale, -1.0, 1.0, move_speed)
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN_OUT)

func update_scale(t: float):
	# 使用正弦函数创建平滑的缩放效果
	# 缩放范围在 original_scale 的基础上波动
	var scale_factor = 1.0 + sin(t * PI) * (move_amplitude / 10.0)
	scale = original_scale * scale_factor

# 可选：暂停/恢复动画
func toggle_movement():
	if tween and tween.is_valid():
		if tween.is_running():
			tween.pause()
		else:
			tween.play()
