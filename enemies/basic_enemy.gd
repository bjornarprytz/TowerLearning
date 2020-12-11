extends Area2D

var stats : EnemyStats
var direction : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * stats.speed * delta
	
func initialize(_stats: EnemyStats, _direction: Vector2) -> void:
	direction = _direction
	stats = _stats
	
	get_node("TextureRect").texture = stats.sprite
