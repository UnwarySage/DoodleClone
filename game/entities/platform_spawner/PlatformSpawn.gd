extends Node2D

export (PackedScene) var platform
export (int) var spawn_area_width
export (int) var spawn_area_margin
export (float) var spawn_platform_shift = 300

var last_height = self.global_position.y
var target_height = 0

var spawn_heights = [90,100,95,150,115]

func _ready():
	self.global_position.x = 0
	randomize()
	


func spawn_platform():
	var shift = Vector2(0,0)
	shift.x = randf() * (spawn_area_width - (spawn_area_margin * 2))
	shift.x += spawn_area_margin
	var spawn = platform.instance()
	spawn.global_position = Vector2(shift.x,self.global_position.y)
	get_tree().get_root().add_child(spawn)


func spawn_row():
	spawn_platform()
	if(randi() % 5 == 0):
		spawn_platform()
		if(randi() % 5 == 0):
			spawn_platform()

func _physics_process(delta):
	if(abs(last_height-self.global_position.y) > target_height):
		spawn_row()
		last_height = self.global_position.y
		print(target_height)
		target_height = spawn_heights[randi()%spawn_heights.size()] 
