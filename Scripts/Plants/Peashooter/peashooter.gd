extends PlantDriver 
@export var anim : AnimationPlayer
func _ready():
	super._ready()#运行上级节点的方法
	anim = $Plant001PeaShooterSingle/AnimationPlayer
	anim.speed_scale = operating_speed
	if face_foward == false:
		scale.x = -abs(scale.x)
