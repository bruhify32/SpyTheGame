extends CanvasModulate

const DARK : Color = Color("524747");

const NIGHT_VISION : Color = Color("438a50");

onready var audio_stream_player : AudioStreamPlayer2D = $AudioStreamPlayer2D;
onready var dark_mode_sound  = load("res://SFX/nightvision_off.wav");
onready var night_vision_sound = load("res://SFX/nightvision.wav");

func _ready():
	color = DARK;

func cycle_vision_mode():
	if color == NIGHT_VISION:
		dark_mode();
	else:
		night_vision_mode();

func night_vision_mode():
	color = NIGHT_VISION;
	audio_stream_player.stream = night_vision_sound;
	audio_stream_player.play();

func dark_mode():
	color = DARK;
	audio_stream_player.stream = dark_mode_sound;
	audio_stream_player.play();
	