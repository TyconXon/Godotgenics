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

@export var pathing : Dictionary[int, PathSegment]
@export var endings : Array[MapLayout]
@export var endings_can_go_home := true
