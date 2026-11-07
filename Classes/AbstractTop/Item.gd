class_name Item
extends Resource

@export var name : String;
@export_multiline var description : String;
@export var slot : Enums.ItemSlots;
@export_enum("common", "uncommon", "rare", "very_rare", "consumable_common", "consumable_uncommon", "consumable_rare", "consumable_very_rare", "quest", "sidequest") var rarity = "common"; 
@export var part_of_sets : Array[ItemSet];
@export var icon: Texture2D;
@export var cursed := false;
@export var parasite := false;
@export var sticky := false;
@export var fragile := false;
@export var indestructable := false;
@export var durability := -1;
@export var passives: Array[Passive]; #Should be gonPassive
@export var attack: Ability;
@export var on_use: Ability;


class ItemSet:
	extends Resource;
	@export var name: String;
	@export_multiline var description: String;
	@export var pieces_required: int = 3;
	@export var shield: int = 0;
	@export var divine_shield: int = 0;
	@export var givestat: Dictionary[Enums.Stats,int];
	@export var passives: Array[Passive]; #Should be gonPassive
