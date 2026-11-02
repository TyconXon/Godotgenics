class_name Character
extends CharacterBody2D

@export var variant_of: Character
@export var stats: Dictionary[Enums.Stats, int]

@export_group("Visual")
@export var display_name: String
@export_multiline var tooltip: String
@export var graphics: AnimatedSprite2D
@export var visual_scale: Vector2:
	get:
		return graphics.scale
	set(value):
		graphics.scale = value

@export_group("Properties")
@export var tag: Array[String]
@export var movement_stacks: int
@export var basic_stacks: int
@export var faction: Enums.Factions
