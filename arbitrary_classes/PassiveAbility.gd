class_name PassiveAbility
extends Resource

@export var name : String
@export_multiline var description: String
@export_multiline var description_multiclass: String 
@export var dedicated_class: Class
@export var tags: Array[String];
@export var stats: Dictionary[Enums.Stats,int]
@export var upgrades_to: PassiveAbility
@export var passives: Array[Resource]; #Should be gonPassive
