extends CharacterBody2D

var speed := 100

func _ready():
	pass

#warning-ignore:unused_argument
func _process(_delta):
	#warning-ingnore:return_value_discarded
	velocity.y = -speed
	move_and_slide()
