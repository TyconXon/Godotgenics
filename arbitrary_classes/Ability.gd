class_name Ability
extends Resource

@export var name: String;
@export_multiline var description: String;
@export var tags: Array[String];
@export var chain_ability: Ability;

@export_category("Meta")
@export_file_path() var ability_icon;
@export_enum("Movement", "Spawn", "Debuff", "Buff", "Misc", "Unknown", "Heal", "Defense", "Ranged", "Magic") var type;
@export var is_basic_move := false; ##If this ability is the character movement (like the button above the basic attack thing)
@export var is_basic_attack := false;
@export var dedicated_class : Class;
var damage_display: int;

@export_category("Cost")
@export var movement_points_cost := 0;
@export var attack_points_cost := 0;
@export var mana_cost : int;
@export var infinite_casts: bool;
@export var only_once_per_turn: bool;
@export var coin_cost: int;
@export var once_per_fight: bool;
@export var must_be_first_action: bool;
@export var can_be_refreshed: bool;
var cant_cast: Callable;

@export_category("Target")
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
@export var target_requires_tag: Array[String];
@export var target_requires_element: Array[Enums.Elements];
@export var comparison: Dictionary[Enums.XIs, Enums.Comparisons];
@export var line_of_site := false;
@export var only_first : bool;
@export var use_projectile := false;

@export_category("Damage Instance")
@export_enum("ranged", "melee", "spell", "status_spell", "spell_cost", "physical_spell", "generic_physical", "knockblock", "spawn", "trample", "none") var damage_type; 
@export var damage: int;
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
@export var two_way_contact := false; ## If the ability contact counts as contact for the target as well
@export var disallow_modifications := false; ## If the damage/heal of the damage instance isn't allowed to be modified
@export var layer : Enums.Layers;
@export var elements : Array[Enums.Elements];
@export var effects : Array[Resource];

@export_category("Spawn")
@export var spawn_object: Array[Character];
@export var spawn_faction: Enums.Factions;
@export var clone_items := false;
@export var inherit_elite_buffs := true;
@export_enum("next_turn", "initiative", "next_round", "end_of_round") var first_turn;
@export var spawn_layer : Enums.Layers;
