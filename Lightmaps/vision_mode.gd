extends CanvasModulate

const DARK : Color = Color("222623");

const NIGHT_VISION : Color = Color("438a50");

var cooldown : bool = false;

onready var timer : Timer = $Timer;
onready var audio_stream_player : AudioStreamPlayer2D = $AudioStreamPlayer2D;
onready var dark_mode_sound  = load("res://SFX/nightvision_off.wav");
onready var night_vision_sound = load("res://SFX/nightvision.wav");

func _ready():
	visible = true;
	color = DARK;

func cycle_vision_mode():
	if not cooldown:
		if color == NIGHT_VISION:
			dark_mode();
		else:
			night_vision_mode();
		cooldown = true;
		timer.start();

func night_vision_mode():
	color = NIGHT_VISION;
	audio_stream_player.stream = night_vision_sound;
	audio_stream_player.play();
	get_tree().call_group("lights","hide");
	get_tree().call_group("labels","show");

func dark_mode():
	color = DARK;
	audio_stream_player.stream = dark_mode_sound;
	audio_stream_player.play();
	get_tree().call_group("lights","show");
	get_tree().call_group("labels","hide");

func _on_Timer_timeout():
	cooldown = false;