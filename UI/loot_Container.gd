extends NinePatchRect

onready var item_list : ItemList = $VBoxContainer/ItemList;

func _ready():
	hide();

func collect_loot():
	show();
	item_list.add_icon_item(load("res://GFX/Loot/suitcase.png"),false);
