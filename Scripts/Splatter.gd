extends Area2D

var mousepos

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func _physics_process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	mousepos = get_viewport().get_mouse_position()
	
	#print(mousepos)
	self.position = mousepos
	
	if Input.is_action_pressed("ui_lmbclick"):
		# kill the spider by getting the collision instance and then calling the queue free
		# play the swat anim
		# play sound effect
		# replace the spider sprite with splat
		var colBodies = get_overlapping_bodies()
		for body in colBodies:
			body.queue_free()
