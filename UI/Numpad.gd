extends Popup

var combination : Array = [0,4,5,1];
var guess : Array = [];
onready var display : Label = $NinePatchRect/VBoxContainer/DisplayContainer/Display;
onready var status_light : TextureRect = $NinePatchRect/VBoxContainer/ButtonContainer/GridContainer/StatusLight;
onready var grid_container : GridContainer = $NinePatchRect/VBoxContainer/ButtonContainer/GridContainer;

signal combination_correct;

func _ready():
    connect_buttons();
    reset_lock();

func connect_buttons():
    for child in grid_container.get_children():
        if child is Button:
            child.connect("pressed",self,"button_pressd",[child.text]);

func button_pressd(button : String):
    if button == "OK":
        check_guess();
    else:
        enter(int(button));

func check_guess():
    if guess == combination:
        emit_signal("combination_correct");
        reset_lock();
    else:
        reset_lock();

func enter(button : int):
    guess.append(button);
    update_display();

func update_display():
    display.text = PoolStringArray(guess).join("");
    if guess.size() == combination.size():
        check_guess();

func reset_lock():
    display.text = "";
    guess.clear();