extends Area2D

var stats : EnemyStats
var direction : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("enemies")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * stats.speed * delta
	
func initialize(_stats: EnemyStats, _direction: Vector2) -> void:
	direction = _direction
	stats = _stats
	
	get_node("TextureRect").texture = stats.sprite


func _on_tree_exiting():
	print("%s dying" % stats.name)
	remove_from_group("enemies")
