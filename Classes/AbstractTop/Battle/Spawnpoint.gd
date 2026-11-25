@tool
class_name Spawnpoint extends Sprite2D
@export var spawn : Unit :
	set(a):
		spawn = a;
		if a != null:
			self.texture = a.graphics;
		else:
			self.texture = load("res://Art/Icon/UI_Cat_Icon.svg")
		scale = (get_parent().get_parent() as Board).vector_grid_pixel_size() / texture.get_size()
@export var board_position : Vector2i : 
	set(a):
		board_position = a;
		var mb = (get_parent().get_parent() as Board);
		position = (mb.grid_pixel_size * a) + ( mb.vector_grid_pixel_size() / 2);
@onready var my_board_layer : BoardLayer = get_parent();
@onready var my_board : Board = get_parent().get_parent();
@export_enum("no","player") var special = "no";
