extends Sprite

#pointer UI for present height, and also tracking max height
signal new_height

func new_input_height(new_height):
	if (self.global_position.y > new_height):
		emit_signal("new_height", new_height)
		self.global_position.y = new_height
		
		

