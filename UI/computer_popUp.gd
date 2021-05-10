extends Popup

onready var label : Label = $NinePatchRect/CenterContainer/NinePatchRect/Label;

func set_text(combination):
	label.text = (
		"Will you stop forgetting your acess code?! Ive set it to "
		+ PoolStringArray(combination).join("") + 
		", but this is the very last time"
	);
