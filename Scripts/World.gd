extends Node2D

export var INTERVAL = 0.01
onready var spider = load("res://Scenes/Spider1.tscn")

func _ready():

	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _fixed_process(delta):

	pass

	# if spawn timer ended:
		# spawn spider
		# reset timer
	# if spider dead:
		# spawn time -= 0.01

func _on_Spawntimer_timeout():
	spawn()
	$Spawntimer.start()
	
func spawn():
	var spawningInstance = spider.instance()
	add_child(spawningInstance)
	
func splat(body):
	body.queue_free()
