class_name Pawn extends Node2D
@onready var my_board;
@export var board_position : Vector2; # todo: Get set
@export var character : Unit;
@export var graphics_node : Sprite2D;

func _ready() -> void:
	character.pawn = self;
	graphics_node.texture = character.graphics
