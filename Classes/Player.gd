class_name Player
extends Resource


@export_group("Adventure", "adventure_")
@export var adventure_mainteam : Array[PlayerCat];
@export var adventure_following : Array[Character];
@export var adventure_backpack : Array[Item];
@export var adventure_food := 10;
@export var adventure_coins := 10;

@export_group("House", "house_")
@export var house_food := 30;
@export var house_coins := 30;
@export var house_storage : Array[Item];
@export var house_storage_size := 10;
@export var house_cats : Array[PlayerCat];
@export var house_upgrades := 3;
