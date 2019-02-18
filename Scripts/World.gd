extends Node2D

export var INTERVAL = 0.02
onready var spider = load("res://Scenes/Spider1.tscn")

func _ready():

	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta):
	if globals.spiderCount >= 500:
		round_end()

func _on_Spawntimer_timeout():
	spawn()
	$Spawntimer.start()
	
func spawn():
	var spawningInstance = spider.instance()
	add_child(spawningInstance)
	globals.spiderCount += 1
	
func splat(body):
	body.queue_free()

func round_end():
	var t = Timer.new()
	t.set_wait_time(3)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	#get_tree().paused = true
	get_node("GameOver").visible = true
	print("donezo")
	yield(t, "timeout")
	t.queue_free()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if globals.points >= globals.highPoints:
		globals.highPoints = globals.points
	get_tree().change_scene("res://Scenes/Title.tscn")
