extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var velocity = Vector2() #velocity


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	var world_rect = get_viewport_rect()
	randomize()
	print(world_rect.end.x)
	print(world_rect.end.y)
	print(world_rect.position.x)
	print(world_rect.position.y)
	
	var random_x = randi()%int(world_rect.end.x - world_rect.position.x) + 1
	var random_y = randi()%int(world_rect.end.y - world_rect.position.y) + 1
	
	print(random_x)
	print(random_y)
	
	
	position.x = 1024#randi()%int(world_rect.end.x - world_rect.position.x) + 1
	position.y = 600#randi()%int(world_rect.end.y - world_rect.position.y) + 1
	velocity = Vector2(0,0)
	#randomize()
	#velocity.x = randi()%200-100
	#velocity.y = randi()%200-100 
	pass
	
func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
	
func _physics_process(delta):
	move_and_slide(velocity)
	
	
func splat():
	queue_free()
	