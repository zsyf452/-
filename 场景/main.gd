extends Node2D

var LEFT_EDGE = 0
var RIGHT_EDGE = 0



@onready var daBian = $"大卞老师"



func _ready():
	Fail.reset()
	#Fail.start($player.position)
	# 获取视口的可见矩形
	var viewport_rect = get_viewport().get_visible_rect()
	 # 获取左边界和右边界
	LEFT_EDGE = viewport_rect.position.x
	RIGHT_EDGE = viewport_rect.position.x + viewport_rect.size.x
	
	#print(daBian.position.x)
	daBian.move(320)
	Globals.startTime = Time.get_unix_time_from_system()


func _on_difficulty_timer_timeout():
	daBian.add_difficulty()
	pass # Replace with function body.
