extends TextureButton


onready var attackRange = get_node("AttackRange/CollisionShape2D")

var stats : TowerStats
var targets = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func initialize(_stats: TowerStats) -> void:
	stats = _stats
	texture_normal = stats.sprite
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_AttackRange_area_entered(area):
	print("Body entered")
	if area.is_in_group("enemies"):
		targets.append(area)
		print("target acquired: ", area)
		area.queue_free() # TODO: Replace with shoot


func _on_AttackRange_area_exited(area):
	print("Body exited")
	if area.is_in_group("enemies"):
		var i = targets.find(area)
		if i == -1:
			return
		targets.remove(i)
		print("target lost: ", area)
