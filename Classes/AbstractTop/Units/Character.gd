@icon("res://Art/Icon/Fighter_Mini_Icon.svg")
class_name Character
extends Unit

# https://github.com/ombrellus/MewgenicsScriptResources/blob/main/character_formatting.md

signal perform_trigger(which : Enums.Trigger, context : EffectCallable.EffectContext)

@export var variant_of: Character
@export var stats: Dictionary[Enums.Stats, int] = {Enums.Stats.strength: 5, Enums.Stats.speed:5, Enums.Stats.intelligence:5,Enums.Stats.charisma:5,Enums.Stats.constitution:5,Enums.Stats.dexterity:5,Enums.Stats.luck:5}

@export_group("Visual") 
#@export var name: String; ##Name of the character
var display_name : String : 
	get:
		return name;
	set(value):
		name = value;
#@export_multiline var description: String; ##Tooltip of the character
#@export var graphics:Texture2D; 
#@export var visual_scale := Vector2.ONE;



@export_group("Properties")
@export var tag: Array[String];
@export var equipped_items: Dictionary[Enums.ItemSlots, Item];
@export var movement_stacks: int = 1 ##How many times this character can use up its movement ability
@export var basic_stacks: int = 1 ##How many times this character can use up the act slot
@export var faction: Enums.Factions 
@export var player_owner : int = 0; ## Which player does this count for as an ally?
@export_enum("Small","Cat","Boss","Object") var type = "Cat";
@export var inherit_faction: bool ##If the character inherits it's faction from the spawner
@export var initial_health := -1; ##Starting health of the character, if -1, then it'll be max-health
@export var base_dispersed_bonus_turns: int = 0; ##Gives additional X bonus turns to the character during the round
var temporary_dispersed_bonus_turns = base_dispersed_bonus_turns;
@export var base_evenly_dispersed_bonus_turns: int = 0; ##Gives additional X bonus turns to the character evenly distributed across the round
var temporary_evenly_dispersed_bonus_turns = base_evenly_dispersed_bonus_turns;
@export var base_round_end_bonus_turns: int = 0; ##Gives additional X bonus turns to the character at the end of the round
var temporary_round_end_bonus_turns = base_round_end_bonus_turns;
@export var flying:=false;
@export var inanimate:=false;
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
@export var player_controlled:=false;
@export var can_run:=false;
@export var shield: int = 0 ;
@export var holy_shield: int = 0;
@export var dodge_chance: float = 0;
@export var reach : int = 1;
@export var range : int = 0;
@export var aoe : int = 0;
@export var current_statuses : Array[Status]

@export_group("Character abilities")
@export var move_ability: Ability; ## If none, default
@export var attack_ability: Ability;
@export var spells: Array[Ability];
@export var passive_abilities: Array[PassiveAbility];
@export var passive: Array[Passive];

@export_group("AI")
@export_enum("GenericBrain", "PatternBrain", "PlayerBrain", "NoBrain") var brain = "GenericBrain";
@export_subgroup("Pattern")
@export var stun_advances_pattern:=true;
@export var randomize_pattern_start:=true;
@export var clamp_pattern:=false; ## Should the last action of the pattern loop repeat over and over instead of the pattern looping?
@export var pattern: Array[Ability];
@export var mainturn_pattern: Array[Ability];
@export var bonusturn_pattern: Array[Ability];


#region Derived Variables
# - - - - - - - - - - -
# - Derived Variables -
# - - - - - - - - - - -

func get_max_health():
		var _d = attributes.get_attribute("max_health", (volatile_stats(Enums.Stats.constitution) * 4));
		if(_d <= 0 and shield == 0): return 1;
		return _d;
var movement: int; #Todo: make this dynamic
var base_movement: int;

func get_max_mana(): return attributes.get_attribute("max_mana",maxi(volatile_stats(Enums.Stats.charisma)*3,0));
func get_mana_regen(): return attributes.get_attribute("mana_regen",maxi(volatile_stats(Enums.Stats.intelligence), 0));
		
@export var base_initiative := 1;
func get_initiative(): return attributes.get_attribute("initiative", base_initiative + (volatile_stats(Enums.Stats.speed) * 2) );
#endregion
# in-combat variables
var attributes := ModifiersSystem.new();

func volatile_stats(a:Enums.Stats) -> float :
	return attributes.get_attribute(Enums.Stats.find_key(a),stats[a]);
	
var health: int = get_max_health() if initial_health == -1 else initial_health;
var mana: int = stats[Enums.Stats.charisma];




func handle_element(element : Enums.Elements):
	#  I drafted this signature while thinking about how the game should
	# handle ice attacks freezing wet characters, persistent elements, etc
	pass

func all_passives() -> Array[Passive]:
	var _culmination : Array[Passive] = [];
	# Sources: Status effects, passive abilities, mutations, items, and class inheritance
	
	for status in current_statuses: 				# Status effects
		_culmination.append(status.passive_effect);
	for ability in passive_abilities:				# Passive abilities
		_culmination.append(ability.passive);
	if self is PlayerCat: 							# Mutations
		for mut in (self as PlayerCat).mutations:
			_culmination.append(mut.passive);
		_culmination.append((self as PlayerCat).collar.innate_passive);
	for item in equipped_items:						# Items
		_culmination.append(equipped_items[item].passive);
	for i in passive: 								# Character specific
		_culmination.append(i);

	return _culmination;

func recieve_trigger(which: Enums.Trigger, context: EffectCallable.EffectContext):
	var all_of_my_passives := all_passives();
	for passive : Passive in all_of_my_passives:
		passive.recieve_trigger(which, context)
	pass
