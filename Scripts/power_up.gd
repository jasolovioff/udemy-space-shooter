extends CharacterBody2D

var speed : = 100
var power_type:String

func _ready():
	velocity.y = speed
	#create_powerup("health")
	
func _process(delta):
	move_and_slide()

func create_powerup(type:String):
	power_type = type
	$AnimationPlayer.play(type)
