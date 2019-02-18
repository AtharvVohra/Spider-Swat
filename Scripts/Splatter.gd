extends Area2D

var mousepos
var worldscript = load("res://Scripts/World.gd").new()
onready var spawntimer = self.get_parent().get_node("Spawntimer")
onready var pointstext = self.get_parent().get_node("Points")

func _ready():
	print(globals.points)
	pass
	
func _physics_process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	mousepos = get_viewport().get_mouse_position()
	
	#print(mousepos)
	self.position = mousepos
	
	if Input.is_action_just_pressed("ui_lmbclick"):
		# kill the spider by getting the collision instance and then calling the queue free
		# play the swat anim
		# play sound effect
		# replace the spider sprite with splat
		var colBodies = get_overlapping_bodies()
		for body in colBodies:
			# kill em
			worldscript.splat(body)
			globals.points += 5
			pointstext.text = String(globals.points)
			print(globals.spiderCount)
			
			# controlling spawn rate cheaply
			worldscript.INTERVAL -= 0.05
			if worldscript.INTERVAL < 0.05:
				worldscript.INTERVAL = 0.2
			spawntimer.wait_time -= worldscript.INTERVAL

