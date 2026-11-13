class_name Unit extends Resource ## Top-level unit class, encompassing characters and objects.

@export var name : String;
@export var description: String;
@export var tags : Array[String];
@export var graphics : Texture2D;
@export var visual_scale := Vector2.ONE;
@export var tile_size := Vector2.ONE;
@export var layer: Enums.Layers;

var pawn : Pawn;

func recieve_trigger(which: Enums.Trigger, context: EffectCallable.EffectContext):
	pass
