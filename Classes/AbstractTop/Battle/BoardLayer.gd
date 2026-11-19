class_name BoardLayer extends Node2D
@export var type : Enums.Layers;
@export var spawn_data : Array[Spawnpoint] ## Auto-gen the board
var data : Array[Pawn]
 
func _ready() -> void:
	initialize_pawns();
	

func initialize_pawns():
	for spwnpoint in spawn_data:
		var curchara = Pawn.new()
		curchara.name = spwnpoint.name + "Pawn"
		curchara.constituent = spwnpoint
		curchara.board_position = spwnpoint.board_position
		curchara.position = spwnpoint * get_parent().grid_pixel_size
		add_child(curchara)
