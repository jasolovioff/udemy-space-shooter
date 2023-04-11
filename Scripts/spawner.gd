extends Node


var powerups_lists := ['health', 'shields', 'speed', 'multi']
var powerup = preload("res://Scenes/power_up.tscn")


func _on_timer_timeout():
	randomize()
	var power_inst = powerup.instantiate()
	var position_x = randi() %201 + 23
	var power = randi() %powerups_lists.size()
	
	var chance = randi() %10
	
	match chance:
		1:
			power_inst.position.x = position_x
			power_inst.create_powerup(powerups_lists[power])
	
			add_child(power_inst)
		_:
			print("no power")
