class_name BattleMananger
extends Node


@export var current_round := 1;
@export var run_aways := 0;
@export var board : Board;
@export var timeline : Array[Pawn]

signal perform_trigger(which : Enums.Trigger, context : EffectCallable.EffectContext)


#region Engine Entrypoints
# --- 
# --- Engine Entrypoints
# ---

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timeline_setup();
	print(timeline);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
#endregion
#region Proceedures
# ---
# --- Proceedures
# ---


## Set-up the timeline at the start of every round, using initiative and <extra turns>.
func timeline_setup():
	var all_characters : Array[Pawn] = all_pawns_from_layer(Enums.Layers.characters)
	all_characters.sort_custom(func(a:Pawn,b:Pawn):return a.constituent.get_initiative() > b.constituent.get_initiative())
	timeline = all_characters



#endregion
#region Helper Methods
# ---
# --- Helper Methods
# ---

func all_pawns() -> Array[Unit]:
	var culmination: Array = [];
	for layer:BoardLayer in board.layers.values():
		culmination.append_array(layer.data)
	return culmination;
	
func all_pawns_from_layer(layer: Enums.Layers) -> Array[Pawn]:
	return board.layers[layer].data;
#endregion
