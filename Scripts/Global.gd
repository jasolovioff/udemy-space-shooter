extends Node

var size_multiplier := 2

# Called when the node enters the scene tree for the first time.
func _ready():
	get_window().size = get_window().size * size_multiplier
