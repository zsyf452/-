extends CanvasLayer

@onready var video = $VideoStreamPlayer
@onready var start_png = $TextureRect
@onready var animation = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_video_stream_player_finished():
	start_png.show()
	animation.play("start")
	
	
	pass # Replace with function body.




func _on_start_pressed():
	get_tree().change_scene_to_file("res://场景/main.tscn")
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
	pass # Replace with function body.
