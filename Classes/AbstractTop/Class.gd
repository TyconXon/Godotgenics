@icon("res://Art/Icon/UI_Familiar_Icon.svg")
class_name Class
extends Resource

@export var name: String;
@export var description: String;
@export_custom(Registry.PROPERTY_HINT_CUSTOM, "res://Data/Abilities/Basic/all_basic_pools.tres") var attack_pool: Array[StringName];
@export_custom(Registry.PROPERTY_HINT_CUSTOM, "res://Data/Abilities/Spells/all_spell_pools.tres") var ability_pool: Array[StringName];
@export var starter_ability: Ability;
@export_custom(Registry.PROPERTY_HINT_CUSTOM, "res://Data/Registries/all_passive_pools.tres") var passive_pool: Array[StringName];
@export var stat_mod: Dictionary[Enums.Stats,int];
@export var levelup_stat_pool: Array[Enums.Stats];
@export var innate_passive: Passive;
@export var innate_items: Array[Item];
@export_group("Graphics")
@export var palette: Color;
@export var collar_icon: Texture2D;
