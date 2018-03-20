extends KinematicBody2D

export (float) var stat_jump_force
export (float) var stat_move_speed
export (float) var stat_gravity_strength = 3
export (float) var stat_friction = 5
export (float) var stat_max_movespeed = 30

var velocity = Vector2(0,0)
#small vector added to make palyer not stick to platforms as much
var upforce = 0.1

func _unhandled_input(event):
	if(event.is_action("player_jump")):
		jump()



func _physics_process(delta):
	var collision = self.move_and_slide(Vector2(velocity.x,velocity.y - upforce),Vector2(0,-1))
	if(!is_on_floor()):
		#apply gravity
		velocity.y += stat_gravity_strength
	else:
		#cancel falling
		velocity.y = 0
		
	#handle horizontal movement
	var new_facing = 0
	if(Input.is_action_pressed("player_move_right")):
		new_facing += 1
	elif(Input.is_action_pressed("player_move_left")):
		new_facing -= 1
	else:
		new_facing = 0
	print(new_facing)
	velocity.x = new_facing * stat_move_speed
	
	var direction = sign(velocity.x)
	velocity.x = max(0.0, abs(velocity.x) - stat_friction)
	velocity.x = velocity.x * direction
	
	
	
	
func jump():
	if(is_on_floor()):
		velocity.y -= stat_jump_force
		print("boing")
	else:
		print("noboing")

	
	