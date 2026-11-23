@tool
class_name Board extends Node2D
@export var size : Vector2 = Vector2i(10,10)
@export var grid_pixel_size := 50.0;
func vector_grid_pixel_size(): return Vector2(grid_pixel_size,grid_pixel_size);
@export var layers : Dictionary[Enums.Layers, BoardLayer];

func _process(delta: float) -> void:
	queue_redraw()

func _draw() -> void:
	
	draw_rect(Rect2(Vector2.ZERO,size*grid_pixel_size),Color.WHITE)
	
	# Mouse square
	var mxy := get_local_mouse_position();
	var r := Rect2(floor(mxy/grid_pixel_size)*grid_pixel_size, Vector2(grid_pixel_size,grid_pixel_size));
	draw_rect(r,Color.AQUA,false)
	

func get_mouse_to_grid() -> Vector2i:
	var mxy := get_local_mouse_position();
	return floor(mxy/grid_pixel_size)
