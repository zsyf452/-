extends CanvasLayer

#blood
@onready var blood = $blood
@onready var score = $score
var BLOOD_PICTURE = [load("res://resources/player/blood(complete).png"),load("res://resources/player/blood(Incomplete).png")]
var world = World
var timestamp = Time
var Begin_ticks_msec = 0;



func _ready():
	calculation_blood()
	world.connect("is_playerHurt",calculation_blood)
	world.connect("update_blood",calculation_blood)
	world.connect("reset",calculation_blood)
	world.connect("reset",update_Begin_ticks_msec)
	world.connect("GameOver",update_score)
	
	pass
	
func _process(delta): 
	
	score.text = str(timestamp.get_ticks_msec() - Begin_ticks_msec + world.additional_score)
	

#计算血量
func calculation_blood():
	
	if world.playerBlood < 0:
		return
	
	#清空重新计算
	for i in range(0,blood.get_child_count()):
		blood.get_child(i).queue_free()
	
	var is_complete
	var addBlood
	var temp = TextureRect.new()
	if world.playerBlood % 2 == 0:
		is_complete = true
		addBlood = world.playerBlood
	else:
		is_complete = false
		addBlood = world.playerBlood - 1
	
	for i in range(0,addBlood/2):
			temp = TextureRect.new()
			temp.texture = BLOOD_PICTURE[0]
			blood.add_child(temp)
	
	if !is_complete:
		temp = TextureRect.new()
		temp.texture = BLOOD_PICTURE[1]
		blood.add_child(temp)
	pass

func update_Begin_ticks_msec():
	Begin_ticks_msec = timestamp.get_ticks_msec()
	
func update_score():
	world.score = score.text
	world.current_gameTime =  timestamp.get_ticks_msec() - Begin_ticks_msec 
	
