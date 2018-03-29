extends Node2D

export (float) var stat_ascent_speed

func _physics_process(delta):
	self.global_position.y -= stat_ascent_speed