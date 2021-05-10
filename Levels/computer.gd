extends Node2D

var can_click : bool = false;
var combination : Array = [];

onready var computer_popup : Popup = $CanvasLayer/ComputerPopUp;
onready var light_2d : Light2D = $Light2D;
onready var label : Label = $Label;

export var combination_length : int = 4;
export var lock_group = "Unset";


signal combination;

func _ready():
	generate_combination();
	emit_signal("combination",combination,lock_group);
	label.rect_rotation = -rotation_degrees;
	label.text = lock_group;

func generate_combination():
	combination = CombinationGenerator.generate_combination(combination_length);
	set_popup_text();

func set_popup_text():
	computer_popup.set_text(combination);

func _on_Area2D_body_entered(body):
	can_click = true;

func _on_Area2D_body_exited(body):
	can_click = false;
	light_2d.enabled = false;
	computer_popup.hide();

func _on_Area2D_input_event(viewport,event,shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		computer_popup.popup_centered();
		light_2d.enabled = true;
