extends CanvasLayer


const Min = 0.1
@onready var picture = $picture
#@export var scene = "res://UI/end.tscn"

func _ready():
	reset()
	#start(Vector2(310,561.7503))
	pass


func reset():
	var shader_material = picture.material as ShaderMaterial
	#shader_material.set_shader_parameter("circle_position",Vector2(0.5,0.5))
	shader_material.set_shader_parameter("circle_size",10)
	#shader_material.set_shader_param("screen_width", get_viewport().size.x)
	#shader_material.set_shader_param("screen_height", get_viewport().size.y)	
	

func start(p:Vector2):
	
	get_tree().paused = true
	# 获取窗口的最大宽度和高度
	var max_width = get_viewport().size.x
	var max_height = get_viewport().size.y
	
	
	var position_x = p.x
	var position_y = p.y
	
	# 将 x 和 y 映射到 [0, 1] 的范围
	#var normalized_x = map_range(position_x, 0, max_width, 0, 1)
	#var normalized_y = map_range(position_y, 0, max_height, 0, 1)
	
	#print("Normalized X:", normalized_x)
	#print("Normalized Y:", normalized_y)
	#将黑圈焦点移动至目标位置
	var shader_material = picture.material as ShaderMaterial
	shader_material.set_shader_parameter("circle_size",0.9)
	shader_material.set_shader_parameter("circle_position",Vector2(position_x,position_y))
	
	var tween = create_tween()
	await tween.tween_property(shader_material, "shader_parameter/circle_size", 0.1, 0.5).finished
	
	
	
	
	pass


func map_range(value, in_min, in_max, out_min, out_max) -> float:
	return (value - in_min) / (in_max - in_min) * (out_max - out_min) + out_min
