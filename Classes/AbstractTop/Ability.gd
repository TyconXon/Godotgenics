@icon("res://Art/Icon/STATUS_Free_Spell_Icon.svg")
class_name Ability
extends Resource

@export var name: String;
@export_multiline var description: String;
@export var tags: Array[StringName];
@export var chain_ability: Ability;

@export_group("Meta")
@export var ability_icon: Texture2D;
@export_enum("Movement", "Spawn", "Debuff", "Buff", "Misc", "Unknown", "Heal", "Defense", "Ranged", "Magic", "Melee") var type:= "Unknown";
@export var is_basic_move := false; ##If this ability is the character movement (like the button above the basic attack thing)
@export var is_basic_attack := false;
@export var dedicated_class : Class;
@export var upgraded_version : Ability; ## This has to be external so you can select it within the inspector
var damage_display: int;

@export_group("Cost")
@export var movement_points_cost := 0;
@export var attack_points_cost := 0;
@export var mana_cost := 0;
@export var infinite_casts: bool = false;
@export var only_once_per_turn: bool = false;
@export var coin_cost: int = 0;
@export var once_per_fight: bool = false;
@export var must_be_first_action: bool = false;
@export var can_be_refreshed: bool = true;
var cant_cast: Callable;

@export_group("Target")
@export_enum("tile", "direction", "direction8", "random_tile", "random_closest_tile", "random_farthest_tile", "random_direction", "none") var target_mode = "none";
@export_enum("standard", "square", "water_move", "groud_move", "cross", "8cross", "diagcross", "last_targetted_tile", "map_edges", "special_tagged_tiles", "custom", "none") var range_mode = "none";
@export_enum("standard", "line", "square", "circle", "perpline", "cross", "diagcross", "8cross", "pierce_cross", "map_edges", "all", "all_except_edges", "all_except_random_empty", "all_except_custom", "narrow_cone", "narrowest_cone", "cone8", "area_around_all_player_cats", "occupied_tiles", "hit_consumer", "custom") var aoe_mode = "standard";
@export var minmax_range: Vector2i;
@export var minmax_aoe: Vector2i;
@export var aoe_excludes_self: bool;
@export var minmax_targets: Vector2i;
@export var can_multihit: bool;
@export var multihit: int;
@export var minmax_multihit: Vector2i;
@export_enum("zero", "character_to_tile", "target_to_tile", "orientation", "back_orentation", "left_orentation", "right_orentation", "character_to_target", "target_to_character", "tile_to_character", "pull_to_character") var knockback_mode = "none";
@export var always_bounce: bool; ## (JUMP ATTACK) If the character always bounces off even if it has trample
@export var delayed_trigger: bool; ## If the ability is casted next turn
@export var aoe_restrictions: Array[Enums.AOERestrictions];
@export var restrictions: Array[Enums.Restrictions];
@export var target_requires_tag: Array[StringName];
@export var target_requires_element: Array[Enums.Elements];
@export var comparison: Dictionary[Enums.XIs, Enums.Comparisons];
@export var line_of_sight := true;
@export var only_first := false;
@export var use_projectile := false;

@export_group("Damage Instance")
@export_enum("ranged", "melee", "spell", "status_spell", "spell_cost", "physical_spell", "generic_physical", "knockblock", "spawn", "trample", "none") var damage_type; 
@export var damage: int;
#@export var damage_scaler:  Enums.Stats;
@export var raw_damage: int;
@export var heal: int;
@export var knockback: int;
@export var can_instapop := true; ## If it can overkill and destory bodies
@export var collects_pickups := false;
@export var cant_miss := false;
@export var piercing := false; ## If the ability ignores shield
@export var makes_contact := false; ## If the ability counts as contact with the tile
@export var force_no_contact := false; ## If the ability forces there to be no contact to the targetted tile
@export var contact_requires_adjacency := true; ## If the contact requires the character to be adjacent
@export var force_adjacent_and_diagonal_contact := false; ## If contact is forced even diagonally
@export var two_way_contact := true; ## If the ability contact counts as contact for the target as well
@export var disallow_modifications := false; ## If the damage/heal of the damage instance isn't allowed to be modified
@export var layer : Enums.Layers = Enums.Layers.characters;
@export var elements : Array[Enums.Elements];
@export var effects : Array[GDScript];

@export_group("Spawn")
@export var spawn_object: Array[Character];
@export var spawn_faction: Enums.Factions;
@export var clone_items := false;
@export var inherit_elite_buffs := true;
@export_enum("next_turn", "initiative", "next_round", "end_of_round") var first_turn;
@export var spawn_layer : Enums.Layers;
