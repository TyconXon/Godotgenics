class_name Game
extends Resource

@export var game_name := "Game 1";

@export var on_adventure := true;
@export var on_map := true;
@export var paused := false;
@export var area : Enums.Chapters;
@export var area_progress := 0; ## How many nodes are we into this area? Arbitrarily, we'll say they end at 10
@export var day := 2;
@export var players : Array[Player];
