extends StaticBody2D


func _on_VisibilityNotifier2D_screen_exited():
	print("ack")
	self.queue_free()
	
