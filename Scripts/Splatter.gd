extends Area2D

var mousepos
var worldscript = load("res://Scripts/World.gd").new()
onready var spawntimer = self.get_parent().get_node("Spawntimer")
onready var pointstext = self.get_parent().get_node("Points")
var shadow = load("res://Assets/swatter/shadow.png")
var swatter = load("res://Assets/swatter/swatter.png")

func _ready():
	print(globals.points)
	
func _physics_process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.		
	mousepos = get_viewport().get_mouse_position()
	
	#print(mousepos)
	self.position = mousepos
	
	if Input.is_action_just_pressed("ui_lmbclick"):
		$Sprite2.show()
		$Sprite.hide()
		# kill the spider by getting the collision instance and then calling the queue free
		# play the swat anim
		# play sound effect
		# replace the spider sprite with splat
		var colBodies = get_overlapping_bodies()
		for body in colBodies:
			$Splat.play()
			# kill em
			
			worldscript.splat(body)

			globals.points += 5
			pointstext.text = String(globals.points)
			print(globals.spiderCount)
			
			# controlling spawn rate cheaply
			if globals.spiderCount > 6 and globals.spiderCount < 20:
				spawntimer.wait_time = 0.8
			if globals.spiderCount >= 20 and globals.spiderCount < 40:
				spawntimer.wait_time = 0.6
			if globals.spiderCount >= 40 and globals.spiderCount < 100:
				spawntimer.wait_time = 0.5
			if globals.spiderCount >= 100 and globals.spiderCount < 140:
				spawntimer.wait_time = 0.3
			if globals.spiderCount >= 140 and globals.spiderCount < 180:
				spawntimer.wait_time = 0.1
			if globals.spiderCount >= 180:
				spawntimer.wait_time -= worldscript.INTERVAL
		$Swat.start()

func _on_Swat_timeout():
	$Sprite2.hide()
	$Sprite.show()