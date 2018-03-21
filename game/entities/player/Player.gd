extends KinematicBody2D

export (float) var stat_jump_force
export (float) var stat_move_speed
export (float) var stat_gravity_strength 

var velocity = Vector2(0,0)
var peaked = false

#signals
signal change_facing
signal jump
signal new_peak_height

func _physics_process(delta):
	if(!is_on_floor()):
		#apply gravity
		velocity.y += stat_gravity_strength
	else:
		#cancel falling
		velocity.y = 0
	#emit new height
	if(!peaked):
		if(velocity.y > 0):
			peaked = true
			emit_signal("new_peak_height", self.global_position.y)

	#handle jumping
	if(Input.is_action_pressed("player_jump") && is_on_floor()):
		velocity.y = -stat_jump_force
		emit_signal("jump")
		peaked = false
	#handle horizontal movement
	var new_facing = 0
	if(Input.is_action_pressed("player_move_right")):
		new_facing += 1
	elif(Input.is_action_pressed("player_move_left")):
		new_facing -= 1
	else:
		new_facing = 0
	emit_signal("change_facing", new_facing)
	velocity.x = new_facing * stat_move_speed
	var collision = self.move_and_slide(velocity,Vector2(0,-1))
	
	
	

	
	