extends Node2D

func _ready():
	update_pointer_positions(0);

func update_pointer_positions(object_number):
	var pointer : Sprite = $ObjectivePointer;
	var place : Position2D = $ObjectivePositions.get_child(object_number);
	$Tween.interpolate_property(pointer,"position",pointer.position,
		place.position,0.5,Tween.TRANS_SINE,Tween.EASE_IN_OUT);
	$Tween.start();

func _on_MoveObjective_body_entered(body):
	update_pointer_positions(1);

func _on_DoorObjective2_body_entered(body):
	update_pointer_positions(2);

func _on_NightVissionObjective3_body_entered(body):
	update_pointer_positions(3);

func _on_BriefCaseObjective4_body_entered(body):
	update_pointer_positions(4);

func _on_ComputerObjective_body_entered(body):
	update_pointer_positions(5);

func _on_UnlockObjective_body_entered(body):
	update_pointer_positions(6);
