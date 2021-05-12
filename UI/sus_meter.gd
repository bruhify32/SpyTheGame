extends TextureProgress


export var sus_multiplier : int = 2;

func _ready():
	value = 0;

func _process(delta):
	value -= step;

func player_seen():
	value += step * sus_multiplier;

	if value == max_value:
		end_game();

func end_game():
	get_tree().change_scene("res://Levels/LoseScreen.tscn");