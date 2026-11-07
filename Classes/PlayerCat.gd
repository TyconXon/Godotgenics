@icon("res://Art/Icon/UI_Cat_Icon.svg")
class_name PlayerCat
extends Character


@export var level: int = 1;
class Injury:
	extends Resource;
	@export var name: String;
	@export var icon: Image;
	@export var affects: Dictionary[Enums.Stats, int];
@export var injuries: Array[Injury];
@export var mutations: Array[Mutation];

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
