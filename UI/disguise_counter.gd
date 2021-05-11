extends ItemList

var item_icon = "res://GFX/PNG/Tiles/tile_130.png";

func update_disguises(number):
	clear();
	for disguises in range(number):
		add_icon_item(load(item_icon),false);