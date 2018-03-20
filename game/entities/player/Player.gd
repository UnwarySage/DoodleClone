extends KinematicBody2D

export (float) var stat_jump_force
export (float) var stat_move_speed
export (float) var stat_gravity_strength = 3

var velocity = Vector2(0,0)

func _unhandled_input(event):
	if(event.is_action("player_jump")):
		jump()
		

func _physics_process(delta):
	var collision = self.move_and_slide(velocity,Vector2(0,-1))
	if(!is_on_floor()):
		#apply gravity
		velocity.y += stat_gravity_strength
	else:
		#cancll falling
		velocity.y = 0
	
	
	
func jump():
	if(is_on_floor()):
		velocity.y -= stat_jump_force
		print("boing")

	
	