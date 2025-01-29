extends CanvasLayer



func _ready():
	get_tree().paused = false
	

func _on_video_stream_player_finished():
	
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_start_pressed():
	get_tree().change_scene_to_file("res://场景/main.tscn")
	pass # Replace with function body.
