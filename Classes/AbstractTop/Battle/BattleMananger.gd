extends Node


@export var current_round := 1;
@export var run_aways := 0;
@export var board : Board;
@export var timeline : Array[Character]

signal perform_trigger(which : Enums.Trigger, context : EffectCallable.EffectContext)





# --- 
# --- Engine Entrances
# ---

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# ---
# --- Proceedures
# ---


## Set-up the timeline at the start of every round, using initiative and extra turns.
func timeline_setup(characters : Array[Character]):
	pass



# ---
# --- Helper Methods
# ---

func all_units() -> Array[Unit]:
	var culmination: Array = [];
	for layer:BoardLayer in board.layers.values():
		culmination.append_array(layer.data.values())
	return culmination;
	
func all_units_from_layer(layer: Enums.Layers) -> Array[Unit]:
	return board.layers[layer].data.values();
