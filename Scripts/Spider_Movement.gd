extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var velocity = Vector2(1,1) #velocity


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	randomize()
	velocity.x = randi()%200-100
	velocity.y = randi()%200-100

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
	
func _physics_process(delta):
	move_and_slide(velocity)
	