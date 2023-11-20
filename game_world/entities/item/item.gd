extends Node2D

var mouse_down=false
var mouse_over=false

var dragging = false
var click_radius = 150

 # Size of the sprite.

func _process(delta):
	if(mouse_down and mouse_over):
		position = get_global_mouse_position()

func _get_drag_data(at_position):
	#print(at_position)
	return true
	
func _can_drop_data(at_position, data):
	return true

func _drop_data(at_position, data):
	print(data)
	print(at_position)

func _on_mouse_entered():
	set_scale(Vector2(1.2,1.2))
	mouse_over = true

func _on_mouse_exited():	
	set_scale(Vector2(1,1))	
	mouse_over = false


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if (event.position - position).length() < click_radius:
			# Start dragging if the click is on the sprite.
			if not dragging and event.pressed:
				dragging = true
		# Stop dragging if the button is released.
		if dragging and not event.pressed:
			dragging = false

	if event is InputEventMouseMotion and dragging:
		# While dragging, move the sprite with the mouse.
		position = event.position
		position.x = position.x + randf_range(10,15) 
		position.y = position.y + randf_range(10,15) 
