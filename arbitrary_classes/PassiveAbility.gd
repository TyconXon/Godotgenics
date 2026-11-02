class_name PassiveAbility
extends Resource

@export var name : String
@export_multiline var description: String
@export_multiline var description_multiclass: String 
@export_file var dedicated_class
@export var tags: Array
@export var stats: Dictionary[Enums.Stats,int]
@export var upgrades_to: PassiveAbility
