@tool
class_name Spawnpoint extends Sprite2D
@export var spawn : Unit
@export var board_position : Vector2;
@onready var my_board_layer : BoardLayer = get_parent();
@onready var my_board : Board = my_board_layer.my_board;
@export_enum("no","player") var special = "no";
