extends "res://道具/道具.gd"

@export var scene = "res://UI/end.tscn"

@onready var failAudioStream = $FailAudioStream

func _on_area_2d_body_entered(body):
	if(body.is_in_group("floor")):
		Globals.endTime = Time.get_unix_time_from_system()
		Globals.mainUI.visible = false
		failAudioStream.play()
		print(position)
		Fail.start(position)
		#Fail.start(Vector2(0.2,0.8))
		#queue_free()
		print("游戏结束")
		
		
		#print("地板")
	
	pass # Replace with function body.


func _on_fail_audio_stream_finished():
	# 切换到新场景
	var end_scene = load(scene)
	get_tree().change_scene_to_file(scene)
	pass # Replace with function body.
