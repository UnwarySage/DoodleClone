extends AnimatedSprite


func _on_PlayerBody_change_facing(new_facing):
	animation = "walk"
	flip_h = !(new_facing < 0)
	if(new_facing==0):
		animation = "stand"