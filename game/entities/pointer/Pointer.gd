extends Sprite

#pointer UI for present height, and also tracking max height
signal new_height

func new_input_height(new_height):
	if (self.global_position.y > new_height):
		emit_signal("new_height", new_height)
	var new_pos = Vector2(self.position.x, new_height)
	$PointerTween.interpolate_property(self, "position", self.position, new_pos, 0.5,Tween.EASE_OUT_IN,Tween.TRANS_SINE)
	$PointerTween.start()

