extends Sprite2D


var scroll_speed := 35
@export var reset_scroll := 0
@export var start_scroll := 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.y += scroll_speed * delta
	
	if self.position.y >= reset_scroll :
		self.position.y = start_scroll
