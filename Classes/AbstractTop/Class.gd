@icon("res://Art/Icon/UI_Familiar_Icon.svg")
class_name Class
extends Resource

@export var name: String;
@export var description: String;
@export var attack_pool: Array[Ability];
@export var ability_pool: Array[Ability];
@export var starter_abilities: Array[Ability];
@export var passive_pool: Array[PassiveAbility];
@export var stat_mod: Dictionary[Enums.Stats,int];
@export var levelup_stat_pool: Array[Enums.Stats];
@export var innate_passive: Passive; # Should be gonPassive
@export var innate_items: Array[Item];
@export_group("Graphics")
@export var palette: Color;
@export var collar_icon: Texture2D;
