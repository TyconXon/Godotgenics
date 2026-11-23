@icon("res://Art/Icon/STATUS_Shield_Icon.svg")
class_name PassiveAbility
extends Resource

@export var name : String
@export_multiline var description: String
@export_multiline var description_multiclass: String 
@export var dedicated_class: Class
@export var tags: Array[StringName];
#@export var stats: Dictionary[Enums.Stats,int]
@export var upgraded_version: PassiveAbility ## This has to be external so you can select it within the inspector
@export var passive: Passive; #Should be gonPassive
@export var icon: Texture2D;
