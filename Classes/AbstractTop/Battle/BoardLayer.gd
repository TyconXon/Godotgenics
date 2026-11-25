@tool
class_name BoardLayer extends Node2D
@export var type : Enums.Layers;
@export_storage var spawn_data : Array[Spawnpoint] ## Auto-gen the boardlayer
@onready var my_board : Board = get_parent(); 
var data : Array[Pawn]
 
func _ready() -> void:
	if Engine.is_editor_hint():
		return;
	spawn_data.append_array(get_children().filter(func(a):return a is Spawnpoint));
	initialize_pawns();
	

func initialize_pawns():
	for spwnpoint in spawn_data:
		var curchara = Pawn.new()
		curchara.name = spwnpoint.spawn.name + "Pawn"
		curchara.constituent = spwnpoint.spawn
		curchara.board_position = spwnpoint.board_position
		curchara.position = spwnpoint.board_position * my_board.grid_pixel_size
		data.append(curchara);
		add_child(curchara);
