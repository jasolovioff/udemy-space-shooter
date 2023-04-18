extends CharacterBody2D

#var velocity := Vector2.ZERO
var speed := 100
var normal_shot = preload("res://Scenes/ProjectileNormal.tscn")
var active_power:String

var shield_scene = preload("res://Scenes/shields.tscn")
var shielded := false

@onready var anim_player = $AnimationPlayer
@onready var LeftCannon = $LeftCannon
@onready var RightCannon	= $RightCannon

#warning-ignore:unused_argument
func _process(_delta):
	movement()
	animate()
	shooting()
	#warning-ingnore:return_value_discarded
	set_velocity(velocity)
	move_and_slide()

func movement():
	velocity = Vector2.ZERO
	if Input.is_action_pressed("MoveRight"):
		velocity.x = speed
	elif Input.is_action_pressed("MoveLeft"):
		velocity.x = -speed
		
	if Input.is_action_pressed("MoveUp"):
		velocity.y = -speed
	elif Input.is_action_pressed("MoveDown"):
		velocity.y = speed
	
	velocity = velocity.normalized() * speed

func animate():
	if velocity.x > 0:
		anim_player.play("TurnRight")
	elif velocity.x < 0:
		anim_player.play("TurnLeft")
	else:
		anim_player.play("Idle")

func shooting():
	if Input.is_action_just_pressed("Shoot"):
		var shot_inst = normal_shot.instantiate()
		var shot_inst2 = normal_shot.instantiate()
		shot_inst.position = LeftCannon.global_position
		shot_inst2.position = RightCannon.global_position
		get_parent().add_child(shot_inst)
		get_parent().add_child(shot_inst2)


func _on_timer_timeout():
	match active_power:
		"speed":
			speed = 100
			$PowerUpTimer.stop()
			print("back to normal speed")
		"shields":
			shielded = false
			$PowerUpTimer.stop()
			print("removing shield")
		_:
			pass
			
func shield_toggle():
	self.shielded = true
	var shield_inst = shield_scene.instantiate()
	self.add_child(shield_inst)
