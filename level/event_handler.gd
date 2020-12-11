extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var tower = preload("res://towers/basic_tower.tscn")
onready var enemy = preload("res://enemies/basic_enemy.tscn")

onready var light_enemy = preload("res://enemies/data/light.tres")
onready var heavy_enemy = preload("res://enemies/data/heavy.tres")


var interval = float(1)
var remaining_time = interval

# Called when the node enters the scene tree for the first time.
func _ready():
	print ("event_listener ready")

func _input(event):
	if event is InputEventMouseButton && event.pressed:
		print("Mouse Click/Unclick at: ", event.position)
		var t = tower.instance()
		t.set_position(event.position)
		add_child(t)
		print(get_children())
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	remaining_time -= delta
	
	if (remaining_time < 0):
		_spawn_enemy()
		remaining_time = interval
	
	
func _spawn_enemy():
	
	print("spawning enemy!")
	randomize()
	var x = (randi() % 60) - 30
	
	var e = enemy.instance()
	
	if (x % 2 == 0):
		e.initialize(light_enemy, Vector2(x, 0))
	else:
		e.initialize(heavy_enemy, Vector2(x, 0))
	
	e.set_position(Vector2(10, 200))
	add_child(e)
