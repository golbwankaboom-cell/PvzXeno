extends Area2D

enum MovementState { IDLE, SLOW_MOVE, FAST_MOVE, RETURN }

@export var slow_speed: float = 300.0
@export var fast_speed: float = 600.0
@export var return_speed: float = 100.0
@export var dead_zone: float = 0.2
@export var fast_threshold: float = 0.9
@export var return_distance: float = 20

var velocity: Vector2 = Vector2.ZERO
var current_state: MovementState = MovementState.IDLE

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
