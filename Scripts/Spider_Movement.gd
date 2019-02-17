extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var SPEED = 50
var velocity = Vector2(-SPEED, -SPEED) #velocity

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	var world_rect = get_viewport_rect()
	randomize()
	
	var random_x = randi()%int(world_rect.end.x - world_rect.position.x) + 1
	var random_y = randi()%int(world_rect.end.y - world_rect.position.y) + 1
	
	#position.x = 1024#randi()%int(world_rect.end.x - world_rect.position.x) + 1
	#position.y = 600#randi()%int(world_rect.end.y - world_rect.position.y) + 1
	#velocity = Vector2(-50,-50)
	randomize()
	#velocity.x = randi()%200-100
	#velocity.y = randi()%200-100 
	pass
	
func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
	
func _physics_process(delta):
	move_and_slide(velocity)
	