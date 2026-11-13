class_name Pickup extends Unit ## You gotta stop on these to activate!

@export var easy_effects : Dictionary[Enums.CommonTokens, int]; ## Simple effects
@export var effects : Array[EffectCallable]; ## Other stuffs
@export var statuses : Array[Status];
@export var elements : Array[Enums.Elements];

## Handle from the Battle side
func recieve_trigger(which: Enums.Trigger, context: EffectCallable.EffectContext):
	pass
		
