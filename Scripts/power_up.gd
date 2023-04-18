extends CharacterBody2D

var speed : = 100
var power_type:String
var speed_multiplier := 2

func _ready():
	velocity.y = speed
	#create_powerup("health")
	
func _process(delta):
	if self.position.y > 420:
		self.queue_free()
	move_and_slide()

func create_powerup(type:String):
	power_type = type
	$AnimationPlayer.play(type)


func _on_area_2d_body_entered(body):
	if "Player" in body.name:
		match power_type:
			"speed":
				body.speed *= speed_multiplier
				body.active_power = "speed"
				body.get_node("PowerUpTimer").start()
				print("boosting speed!")
			"shields":
				if not body.shielded:
					body.shield_activate()
					body.shielded = true
					print("activating shield")
			_:
				pass
		self.queue_free()
