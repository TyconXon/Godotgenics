class_name Board extends Node2D
@export var size : Vector2 = Vector2(10,10)
@export var grid_pixel_size := 50;
@export var layers : Dictionary[Enums.Layers, BoardLayer];
