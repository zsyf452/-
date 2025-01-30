extends CanvasLayer

@onready var lableCountPiece = $VBoxContainer/text/countPiece
@onready var lableTime = $VBoxContainer/text/time

func _ready():
	get_tree().paused = false
	lableCountPiece.text += str(Globals.countPiece)
	
	var game_duration = Globals.endTime - Globals.startTime
	var datetime_string = Time.get_datetime_string_from_unix_time(game_duration, true)
	# 提取时间部分（HH:MM:SS）
	var time_string = datetime_string.split(" ")[1]
	print(time_string)  # 输出示例: "14:30:15"
	lableTime.text += time_string
	

func _on_video_stream_player_finished():
	
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_start_pressed():
	get_tree().change_scene_to_file("res://场景/main.tscn")
	pass # Replace with function body.
