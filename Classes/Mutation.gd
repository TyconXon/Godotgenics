class_name Mutation
extends Passive

@export var name : String;
@export var description : String;
@export var stat_modifiers : Dictionary[Enums.Stats, int]
@export var passives: Array[Passive];
