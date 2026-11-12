class_name PathSegment extends Resource
@export var points: PackedVector2Array;
@export var node_definitions: Dictionary[int, MapNode]
#enum end {GoToBranch, LinkToOtherMap, GoHome}
@export var redirect_branches : Array[int]; ## Array of integers representing possible pathSegment ids to travel to
@export var redirect_map : Array[MapLayout]; ## Nullable list of path map exits
#@export var is_a_path_home := false; ## If this segment ends in going home
