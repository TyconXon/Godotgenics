@icon("res://Art/Icon/STATUS_Stun_Icon.svg")
class_name Status
extends Resource

@export var name : String;
@export var icon : Texture2D;
@export_multiline var description : String;
var stacks = 1;

@export var passive_effect : Passive;
@export var unimportant := false;
