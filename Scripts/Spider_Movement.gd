extends KinematicBody2D

export var SPEED = 120
var SELECTION_RATIO = 0.75
var velocity = Vector2(0,0) #velocity

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	var world_rect = get_viewport_rect()
	randomize()
	
	var spawn_side = randi()%4 + 1  #Deciding which side the spider will spawn on
	var dest_side  = randi()%2 + 1  #Deciding whether the spider will move towards the horizontal side or the 
	var dest_pos = Vector2(0,0)
	
	# Determining starting position based on starting side
	match spawn_side:
		1: #TOP SIDE
			position.x = world_rect.position.x + randi()%int(world_rect.end.x - world_rect.position.x) + 1
			position.y = world_rect.position.y
		2: # RIGHT SIDE
			position.x = world_rect.end.x
			position.y = world_rect.position.y + randi()%int(world_rect.end.y - world_rect.position.y) + 1
		3: # BOTTOM SIDE
			position.x = world_rect.position.x + randi()%int(world_rect.end.x - world_rect.position.x) + 1
			position.y = world_rect.end.y
		4: # LEFT SIDE
			position.x = world_rect.position.x
			position.y = world_rect.position.y + randi()%int(world_rect.end.y - world_rect.position.y) + 1
	

	var halfway_vertical = world_rect.position.y + (world_rect.end.y - world_rect.position.y)/2
	var halfway_horizontal = world_rect.position.x + (world_rect.end.x - world_rect.position.x)/2
	
	#Determining destination point based on destination side
	match dest_side:
		1: #picking a horizontal side
			if position.y < halfway_vertical:
				# GO TOWARDS BOTTOM SIDE
				dest_pos.y = world_rect.end.y
				dest_pos.x = world_rect.position.x + randi()%int(world_rect.end.x - world_rect.position.x) + 1
			else:
				dest_pos.y = world_rect.position.y
				dest_pos.x = world_rect.position.x + randi()%int(world_rect.end.x - world_rect.position.x) + 1
				
			if spawn_side != 1 or spawn_side != 3:
				# adjusting position based on selection ratio
				dest_pos.x = world_rect.position.x + (dest_pos.x - world_rect.position.x)*SELECTION_RATIO
				if spawn_side == 4:
					dest_pos.x += (world_rect.end.x - world_rect.position.x)*(1-SELECTION_RATIO)
				
		
		2: #picking a vertical side
			if position.x < halfway_horizontal:
				# GO TOWARDS RIGHT SIDE
				dest_pos.x = world_rect.end.x
				dest_pos.y = world_rect.position.y + randi()%int(world_rect.end.y - world_rect.position.y) + 1
			else:
				# GO TOWARDS LEFT SIDE
				dest_pos.x = world_rect.position.x
				dest_pos.y = world_rect.position.y + randi()%int(world_rect.end.y - world_rect.position.y) + 1
				
			if spawn_side != 2 or spawn_side != 4:
				dest_pos.y = world_rect.position.y + (dest_pos.y - world_rect.position.y)*SELECTION_RATIO
				if spawn_side == 1:
					dest_pos.y += (world_rect.end.y - world_rect.position.y)*(1-SELECTION_RATIO)
	
	velocity.x = dest_pos.x - position.x
	velocity.y = dest_pos.y - position.y
	velocity = velocity.normalized()
	
	#Moving spooder slightly off screen
	position.x += -velocity.x * 100
	position.y += -velocity.y * 100
			
			
	
func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
	
func _physics_process(delta):
	SPEED = rand_range(75, 175)
	move_and_slide(velocity*SPEED)
	