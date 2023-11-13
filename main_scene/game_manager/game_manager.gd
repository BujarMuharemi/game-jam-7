extends Node

# https://docs.godotengine.org/en/stable/tutorials/io/background_loading.html

var start_scene
var options_scene
## TODO: create independent btns which can be resued in all scenes !
#TODO: make the options start etc just by showing and hiding stuff..avoid load of scenens and a lot of state managment

func _ready():
	options_scene = ResourceLoader.load("res://UI/options_scene/options_scene.tscn")
	var option = options_scene.instantiate()
	add_child(option)
	print(option)
	option.back_from_options_pressed.connect(back_from_option)
	option.visible = false
	
	start_scene = get_node("start_scene")
	start_scene.start_game_pressed.connect(start_game)
	start_scene.options_pressed.connect(show_options)
	

func start_game():
	print("game started")	
	var main_scene = ResourceLoader.load("res://main_scene/main_scene.tscn")	
	var main = main_scene.instantiate()
	
	# removing start scene and adding the main scene
	start_scene.queue_free() 
	add_child(main)

func show_options():	
	var option_scene = ResourceLoader.load("res://UI/options_scene/options_scene.tscn")	
	var option = option_scene.instantiate()
	
	# removing start scene and adding the main scene
	start_scene.queue_free() 
	add_child(option)

func back_from_option():
	#var start_scene = ResourceLoader.load("res://UI/start_scene/start_scene.gd")	
	#var start = start_scene.instantiate()
	
	get_node("options_scene").queue_free()
	#add_child(start)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
