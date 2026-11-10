class_name MapLayout extends Resource
@export var name: String;
@export var chapter_id : Enums.Chapters;
@export var graphics : Texture2D;
@export var act : int;
@export var chapter : int;
@export var music : String;

@export var bosses : Array[MapNode] ## Replace later with node class array
@export var mini_bosses : Array[MapNode] ## ditto
@export_storage var _CHOSEN_BOSS : Resource
@export_storage var _CHOSEN_MINIBOSS : Resource

@export var pathing : Dictionary[int, path_segment]

class path_segment extends Curve2D: 
	@export var node_definitions: Dictionary[int, MapNode]
	#enum end {GoToBranch, LinkToOtherMap, GoHome}
	@export var redirect_branches : Array[int]; ## Array of integers representing possible path_segment ids to travel to
	@export var redirect_map : Array[MapLayout]; ## Nullable list of path map exits
	@export var is_a_path_home := false; ## If this segment ends in going home
