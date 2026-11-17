class_name BoardLayer extends TileMapLayer
@export var type : Enums.Layers;
@export var initial_data : Dictionary[Vector2i, Character] ## Auto-gen the board
var data : Dictionary[Vector2i, Pawn] ## Position to pawn
 
func _ready() -> void:
	initialize_pawns();
	

func initialize_pawns():
	for i in initial_data:
		var curchara = Pawn.new()
		curchara.name = initial_data[i].name + "Pawn"
		curchara.constituent = initial_data[i]
		curchara.board_position = i
		curchara.position = i * get_parent().grid_pixel_size
		add_child(curchara)
