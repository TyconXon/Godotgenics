class_name Character
extends Resource

# https://github.com/ombrellus/MewgenicsScriptResources/blob/main/character_formatting.md

@export var variant_of: Character
@export var stats: Dictionary[Enums.Stats, int] = {Enums.Stats.strength: 5, Enums.Stats.speed:5, Enums.Stats.intelligence:5,Enums.Stats.charisma:5,Enums.Stats.constitution:5,Enums.Stats.dexterity:5,Enums.Stats.luck:5}

@export_group("Visual") 
@export var display_name: String; ##Name of the character
@export_multiline var tooltip: String; ##Tooltip of the character
@export_file_path var graphics; 
@export var visual_scale: Vector2:
	get:
		return graphics.scale
	set(value):
		graphics.scale = value



@export_group("Properties")
@export var tag: Array[String]
@export var movement_stacks: int ##How many times this character can use up its movement ability
@export var basic_stacks: int ##How many times this character can use up the act slot
@export var faction: Enums.Factions 
@export_enum("Small","Cat","Boss","Object") var type = "Cat";
@export var inherit_faction: bool ##If the character inherits it's faction from the spawner
@export var inital_health := -1; ##Starting health of the character, if -1, then it'll be max-health
@export var base_dispersed_bonus_turns: int = 0; ##Gives additional X bonus turns to the character during the round
var temporary_dispersed_bonus_turns = base_dispersed_bonus_turns;
@export var base_evenly_dispersed_bonus_turns: int = 0; ##Gives additional X bonus turns to the character evenly distributed across the round
var temporary_evenly_dispersed_bonus_turns = base_evenly_dispersed_bonus_turns;
@export var base_round_end_bonus_turns: int = 0; ##Gives additional X bonus turns to the character at the end of the round
var temporary_round_end_bonus_turns = base_round_end_bonus_turns;
@export var flying:=false;
@export var tile_size:Vector2i = Vector2i(1,1);
@export var inanimate:=false;
@export var layer: Enums.Layers;
@export var knockback_immune:=false;
@export var can_be_backstabbed:=true;
@export var kill_required:=false;
@export var block_movement:=false;
@export var takes_turns:=true;
@export var can_be_champion:=false;
@export var mana_matters:=true;
@export var can_be_overkilled:=true;
@export var can_collect_coins:=false;
@export var can_eat_food:=false;
@export var base_corpse_health:=3;
@export var is_player_cat:=false;
@export var can_run:=false;



@export_group("Character abilities")
@export var move_ability: Ability;
@export var attack_ability: Ability;
@export var spells: Array[Ability];
@export var passives: Array[PassiveAbility];

@export_group("AI")
@export_enum("GenericBrain", "PatternBrain", "PlayerBrain", "NoBrain") var brain = "GenericBrain";
@export_subgroup("Pattern")
@export var stun_advances_pattern:=true;
@export var randomize_pattern_start:=true;
@export var clamp_pattern:=false; ## Should the last action of the pattern loop repeat over and over instead of the pattern looping?
@export var pattern: Array[Resource];
@export var mainturn_pattern: Array[Resource];
@export var bonusturn_pattern: Array[Resource];
# dynamic variables
var max_health: int:
	get:
		var _d = (volatile_stats[Enums.Stats.constitution] * 4) + flat_max_health;
		if(_d <= 0 and shield == 0): return 1;
		return _d;
	set(value):
		var _c = value - max_health;
		flat_max_health += _c;
var movement: int; #Todo: make this dynamic
var base_movement: int;
var base_max_mana: int: 
	get:
		return maxi(volatile_stats[Enums.stats.charisma]*3,0);
var base_mana_regen: int:
	get:
		return maxi(volatile_stats[Enums.stats.intelligence], 0);
var flat_mana_regen: int;
var mana_regen: int:
	get:
		return base_mana_regen+flat_mana_regen;
	set(value):
		var _c = value - base_mana_regen;
		flat_mana_regen += _c;
	
# in-combat variables
var volatile_stats := stats;
var flat_max_health := 0; 
var health: int;
var mana: int = stats[Enums.Stats.charisma];
var max_mana:int;
@export var shield: int;
