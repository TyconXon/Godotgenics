class_name PlayerCat
extends Character

@export var mutations: Array[Mutation];
@export var crownlevel: Enums.Chapters;
@export var age: int = 2;
@export var old := false;
@export var starving := false;
@export var retired_level: int = 0;
@export_enum("Male", "Female", "Neutral") var gender := "Neutral";
@export_range(0,1) var gayness : float;
@export_range(0,1) var inbredness : float;
@export_range(0,1) var libido : float;
@export_range(0,1) var aggression : float;
enum relationship_status {love, hate}
@export var relationships : Dictionary[relationship_status, PlayerCat]
class Injury:
	extends Resource;
	@export var name: String;
	@export var icon: Image;
	@export var affects: Dictionary[Enums.Stats, int];
@export var injuries: Array[Injury];
