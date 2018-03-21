extends Path2D

export (PackedScene) var platform
export (float) var stat_spawn_delay
export (int) var spawn_area_width
export (int) var spawn_area_margin
export (float) var spawn_platform_shift = 300


func _ready():
	self.global_position.x = 0
	curve.add_point(Vector2(spawn_area_margin,0))
	#should be a reference to screen size
	curve.add_point(Vector2(1024-spawn_area_margin,0))
	
	randomize()
	


func spawn_platform():
	var shift = Vector2(0,0)
	shift.x = randf() * (spawn_area_width - (spawn_area_margin * 2))
	shift.x += spawn_area_margin
	var spawn = platform.instance()
	spawn.global_position = Vector2(shift.x,self.global_position.y)
	
	get_tree().get_root().add_child(spawn)
	$SpawnTimer.wait_time = stat_spawn_delay
	$SpawnTimer.start()
	



func _on_SpawnTimer_timeout():
	spawn_platform()