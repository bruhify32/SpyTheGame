extends Node2D

var can_click : bool = false;

onready var computer_popup : Popup = $CanvasLayer/ComputerPopUp;

func _on_Area2D_body_entered(body):
	can_click = true;

func _on_Area2D_body_exited(body):
	can_click = false;
	computer_popup.hide();

func _on_Area2D_input_event(viewport,event,shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		computer_popup.popup_centered();
