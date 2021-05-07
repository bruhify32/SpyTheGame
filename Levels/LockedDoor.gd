extends "res://Levels/Door.gd"

onready var numpad : Popup = $CanvasLayer/Numpad;

func _on_Door_input_event(viewport,event,shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		numpad.popup_centered();


func _on_Door_body_exited(body):
	if body.collision_layer == 1:
		numpad.hide();

func _on_Numpad_combination_correct():
	open();
	numpad.hide();