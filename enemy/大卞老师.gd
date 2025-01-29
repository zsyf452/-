extends CharacterBody2D

var duration = 1

const PROP = [
	preload("res://道具/棋子(黑.tscn")
]

@onready var anim = $AnimatedSprite2D

@onready var cry = $sound_effects/cry
@onready var slap_face = $"sound_effects/slap _face"

var LEFT_EDGE = 0
var RIGHT_EDGE = 0

func _ready():
	# 获取视口的可见矩形
	var viewport_rect = get_viewport().get_visible_rect()
	 # 获取左边界和右边界
	LEFT_EDGE = viewport_rect.position.x
	RIGHT_EDGE = viewport_rect.position.x + viewport_rect.size.x
	
	while true:
		
		move(randi_range(LEFT_EDGE,RIGHT_EDGE))
		add_prop()
		await get_tree().create_timer(duration).timeout
	
func add_prop():
	var prop = PROP[0].instantiate()
	prop.player_collided.connect(on_player_pickup_item)

	#prop.position.y = 0
	#prop.position.x = randf_range(LEFT_EDGE,RIGHT_EDGE)
	
	prop.position.y = position.y
	prop.position.x = position.x
	
	
	get_node("../黑棋子").add_child(prop)

func move(end_position:int):
	
	var tween = create_tween()
	await  tween.tween_property(self, "position", Vector2(end_position,position.y),duration)
	

func add_difficulty():
	duration -= 0.1 
	pass
	
func on_player_pickup_item():
	var t = randi_range(0,1)
	match t:
		0:
			anim.play("哭")
			cry.play()
		1:
			anim.play("打自己脸")
			slap_face.play()
	
	pass
	


func _on_animated_sprite_2d_animation_finished():
	anim.play("default")
	pass # Replace with function body.
