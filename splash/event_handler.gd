extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_start():
	print("Load level")
	var _e = get_tree().change_scene("res://level/level.tscn")
