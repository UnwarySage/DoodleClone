extends Path2D

export (PackedScene) var platform
export (float) var stat_spawn_delay
export (int) var spawn_area_width
export (int) var spawn_area_margin

func _ready():
	curve.add_point(Vector2(spawn_area_margin,0))
	#should be a reference to screen size
	curve.add_point(Vector2(1024-spawn_area_margin,0))
	
	spawn_platform()

func spawn_platform():
	var spawn = platform.instance()
	spawn.global_position = $SpawnPoint.global_position
	self.add_child(spawn)
	$SpawnPoint.offset = randf() * curve.get_baked_length()
	$SpawnTimer.wait_time = stat_spawn_delay
	
	

func _on_SpawnTimer_timeout():
	spawn_platform()