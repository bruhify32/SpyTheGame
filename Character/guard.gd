extends "res://Character/NPCs/player_detection.gd"

onready var navigation : Navigation2D = get_tree().get_root().find_node("Navigation2D",true,false);
onready var destinations : Node2D = navigation.get_node("Destinations");

var motion : Vector2 = Vector2();
var possible_destinations : Array;
var path : Array;

onready var timer : Timer = $Timer;

export var min_arival_distance : int = 5;
export var walk_speed : float = 0.5;

func _ready():
	randomize();
	possible_destinations = destinations.get_children();
	make_path();

func _physics_process(delta):
	navigate();

func navigate():
	var distance_to_destination = position.distance_to(path[0]);
	if distance_to_destination > min_arival_distance:
		move();
	else:
		update_path();

func update_path():
	if path.size() == 1:
		if timer.is_stopped():
			timer.start();
	else:
		path.remove(0);


func move():
	look_at(path[0]);
	motion = (path[0]-position).normalized() * (MAX_SPEED * walk_speed);
	if is_on_wall():
		make_path();
	move_and_slide(motion);

func make_path():
	var new_destination = possible_destinations[randi()% possible_destinations.size()-1];
	path = navigation.get_simple_path(position,new_destination.position,false);

func _on_Timer_timeout():
	make_path();
