extends CharacterBody2D

const SPEED = 300.0
var GRAVITY = 100.0
signal player_collided
signal landed_on_floor

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	move_and_slide()


func _on_area_2d_area_entered(area):
	emit_signal("player_collided")
	
	queue_free()
	
		
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if(body.is_in_group("floor")):
		emit_signal("landed_on_floor")
		queue_free()
		#print("地板")
	pass # Replace with function body.
