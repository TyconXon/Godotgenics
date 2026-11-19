class_name Pawn extends Node2D

@onready var my_board : Board;
@onready var my_board_layer : BoardLayer;

@export var board_position : Vector2 
@export var constituent: Unit;
var graphics_node : Sprite2D;

func _ready() -> void:
	constituent.pawn = self;
	if graphics_node == null:
		graphics_node = Sprite2D.new();
		graphics_node.name = "GraphicsSprite2D"
		add_child(graphics_node);
	graphics_node.texture = constituent.graphics
