extends CharacterBody2D


const SPEED = 300.0
const ACCELERATE_SPEED = 1500.0
const JUMP_VELOCITY = -400.0
var LEFT_EDGE = 0
var RIGHT_EDGE = 0

var countPiece = 0
#@warning_ignore("unused_signal")
signal update_signal()

@onready var sfx_place_stone = $sfx_place_stone

func _ready():
	# 获取视口的可见矩形
	var viewport_rect = get_viewport().get_visible_rect()
	 # 获取左边界和右边界
	LEFT_EDGE = viewport_rect.position.x
	RIGHT_EDGE = viewport_rect.position.x + viewport_rect.size.x
	
	add_child(preload("res://UI/player/mainUI.tscn").instantiate())
	emit_signal("update_signal")

func _physics_process(delta):

	input(delta)
	
func input(delta):
	if  not is_on_floor():
		velocity += get_gravity() *delta
	else :
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	var speed = SPEED
	if Input.is_action_pressed("accelerate"):
		speed = ACCELERATE_SPEED
		
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)


	

 # 检查是否接触左边界
	if position.x <= LEFT_EDGE and velocity.x < 0:
		velocity.x = 0  # 停止向左移动

	# 检查是否接触右边界
	if position.x >= RIGHT_EDGE and velocity.x > 0:
		velocity.x = 0  # 停止向右移动
	move_and_slide()


@warning_ignore("unused_parameter")
func _on_area_2d_area_entered(area):
	countPiece += 1
	sfx_place_stone.play()
	emit_signal("update_signal")
	pass # Replace with function body.

func getCountPiece():
	return countPiece
