@icon("res://Art/Icon/UI_Cat_Icon.svg")
class_name PlayerCat
extends Character


@export var level: int = 1;
class Injury:
	extends Resource;
	@export var name: String;
	@export var icon: Texture2D;
	@export var affects: Dictionary[Enums.Stats, int];
@export var injuries: Array[Injury];
@export var mutations: Array[Mutation];
@export_custom(Registry.PROPERTY_HINT_CUSTOM, "res://Data/classes.tres") var levelup_class_pools: Array[StringName]

func get_possible_boons(to_level:int) -> Array[Resource]: ## Returns all possible level-up offerings. Might return an array of: Passive Abilities, active abilities, duplicate only list (for upgrades), or items
	# TODO: this
	# First, determine what type of pool this should return from get_boon_pool_type
	# Second, switch off depending on the pool type
	# 	In each switch, culminate the possible boons, pulling from levelup_class_pools, and excluding duplicates (if not exclusive) 
	# Third, check for any intercepting hooks, replacing the output with whatever anything wants it to be instead
	return [];

func get_boon_pool_type(to_level:int) -> String: ## Returns the type of the pool `get_possible_boons()` is going to return. There's an order cats go in with their pools, figure it out. This function will have interception hooks
	return "Passive"
	

@export_group("House stuff")
@export var collar : Class;
@export var crownlevel: int = 0;
@export var age: int = 2;
@export var old := false;
@export var starving := false;
@export var retired_level: int = 0;
@export_enum("Male", "Female", "Neutral") var gender := "Neutral";
@export_range(0,1) var gayness : float = 0;
@export_range(0,1) var inbredness : float = 0;
@export_range(0,1) var libido : float = 0.5;
@export_range(0,1) var aggression : float = 0.1;
enum relationship_status {love, hate}
@export var relationships : Dictionary[relationship_status, PlayerCat]
@export_enum("Outside", "Box", "RoomLeft", "RoomRight", "Attic") var house_position;
