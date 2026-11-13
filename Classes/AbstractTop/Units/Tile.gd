class_name Tile extends Unit ## These activate whenever you walk on them!

@export var movement_cost := 1;
@export var affects_flying := false;
@export var passive : Passive; ## This is for extraneous happenings, like water flowing etc
@export var effect : Array[EffectCallable]; ## This is whenever someone walks on this
@export var statuses : Array[Status]; ## I guess if you wanted to apply an amount of stacks, you could just have multiple of the same status in this array.
@export var elements : Array[Enums.Elements];

func recieve_trigger(which: Enums.Trigger, context: EffectCallable.EffectContext):
	passive.recieve_trigger(which,context);
