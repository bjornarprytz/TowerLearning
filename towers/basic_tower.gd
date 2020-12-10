extends TextureButton


onready var attackRange = get_node("AttackRange/CollisionShape2D").shape.radius


# Called when the node enters the scene tree for the first time.
func _ready():
	print(attackRange)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
