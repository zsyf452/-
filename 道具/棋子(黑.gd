extends "res://道具/道具.gd"

@export var scene = "res://UI/end.tscn"

func _on_area_2d_body_entered(body):
	if(body.is_in_group("floor")):
		queue_free()
		print("游戏结束")
		var end_scene = load(scene)
	# 切换到新场景
		get_tree().change_scene_to_file(scene)
		
		#print("地板")
	
	pass # Replace with function body.
