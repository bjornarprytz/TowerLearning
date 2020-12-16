extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var tower = preload("res://towers/tower.tscn")
onready var enemy = preload("res://enemies/enemy.tscn")

onready var light_enemy = preload("res://enemies/data/light.tres")
onready var heavy_enemy = preload("res://enemies/data/heavy.tres")

onready var arrow_tower = preload("res://towers/data/arrow.tres")
onready var laser_tower = preload("res://towers/data/laser.tres")

var interval = float(1)
var remaining_time = interval

# Called when the node enters the scene tree for the first time.
func _ready():
	print ("event_listener ready")

func _input(event):
	if event is InputEventMouseButton && event.pressed:
		print("Mouse Click/Unclick at: ", event.position)
		var t = tower.instance()
		t.initialize(arrow_tower)
		t.set_position(event.position)
		add_child(t)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	remaining_time -= delta
	
	if (remaining_time < 0):
		_spawn_enemy()
		remaining_time = interval
	
	
func _spawn_enemy():
	randomize()
	var x = (randi() % 20)
	var y = (randi() % 10) - 5
	
	var e = enemy.instance()
	
	if (x % 2 == 0):
		e.initialize(light_enemy, Vector2(x, y).normalized())
	else:
		e.initialize(heavy_enemy, Vector2(x, y).normalized())
	
	e.set_position(Vector2(10, 200))
	add_child(e)
