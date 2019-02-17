extends Node

## LevelManager - populates a list containing future enemy data.
# As the timer advances, any enemy data used is removed from the bank,
# until no entries are left and the level stops spawning enemies.

# Level Bank - 2D Array where each element in the first dimension consists of an Array in the following format:
# [type/class, speed, vector(direction), time_offset (in seconds)]
# [string, float, Vector2, float]

var level_bank = []

var timer
var timer_active = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	timer = get_node("Timer")	
	timer.connect("timeout", self, "_on_Timer_timeout")
	
	set_process_input(true)
	build_level_one()
	

func build_level_one():
	# Empty level bank
	level_bank = []
	# Populate level bank
	for i in range(5):
		var new_direction = Vector2(2.0*i, 1)
		var example_entry = ["spider", 0.5*i, new_direction, 2.0*i]
		level_bank.append(example_entry)

func reset():
	level_bank = []

func _on_Timer_timeout():
	# Spawn the next enemy!
	print("Spawn " + level_bank[0] + " with a speed of " + str(level_bank[1]))
	# Delete front entry of level_bank
	level_bank.pop_front()
	# If entries remaining, set next timer wait time. If none left, stop timer and reset.
	if(!level_bank.empty()):
		timer.set_wait_time(level_bank[0][3])
	else:
		timer_active = false
		timer.stop()
		reset()

func _input(event):
	if event.is_action_pressed("ui_left"):
		#reset()
		timer_active = false
		timer.stop()
	if event.is_action_pressed("ui_right"):
		if(level_bank.empty()):
			build_level_one()
		if(!level_bank.empty()):
			timer.set_wait_time(level_bank[0][3])
			timer_active = true
			timer.start()
	print("BUTTONS!")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
