extends Popup

var combination : Array = [];
var guess : Array = [];
onready var display : Label = $NinePatchRect/VBoxContainer/DisplayContainer/Display;
onready var status_light : TextureRect = $NinePatchRect/VBoxContainer/ButtonContainer/GridContainer/StatusLight;
onready var grid_container : GridContainer = $NinePatchRect/VBoxContainer/ButtonContainer/GridContainer;
onready var audi_stream_player : AudioStreamPlayer2D = $AudioStreamPlayer2D;
onready var timer : Timer = $Timer;

onready var enter_audio = load("res://SFX/twoTone1.ogg");
onready var ok_audio = load("res://SFX/twoTOne2.ogg");
onready var red_dot_texture = load("res://GFX/Interface/PNG/dotRed.png");
onready var green_dot_texture =  load("res://GFX/Interface/PNG/dotGreen.png");

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
        audi_stream_player.stream = ok_audio;
        audi_stream_player.play();
        status_light.texture = green_dot_texture;
        timer.start();
    else:
        reset_lock();

func enter(button : int):
    audi_stream_player.stream = enter_audio;
    audi_stream_player.play();
    guess.append(button);
    update_display();

func update_display():
    display.text = PoolStringArray(guess).join("");
    if guess.size() == combination.size():
        check_guess();

func reset_lock():
    status_light.texture = red_dot_texture;
    display.text = "";
    guess.clear();

func _on_Timer_timeout():
    emit_signal("combination_correct");
    reset_lock();