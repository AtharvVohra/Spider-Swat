extends KinematicBody2D

export var SPEED = 0
var velocity = Vector2(0,0) #velocity

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	if randf() > 0.5:
		$dead1.hide()
	else:
		$dead2.hide()
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
#	
#func _physics_process(delta):
#	pass