class_name Class
extends Resource

@export var name: String;
@export var description: String;
@export var attack_pool: Array[Resource];
@export var ability_pool: Array[Resource];
@export var starter_abilities: Array[Resource];
@export var passive_pool: Array[Resource];
@export var stat_mod: Dictionary[Enums.Stats,int];
@export var levelup_stat_pool: Array[Enums.Stats];
@export var innate_passives: Array[Resource];
@export var innate_items: Array[Resource];
@export_group("Graphics")
@export var palette: Color;
