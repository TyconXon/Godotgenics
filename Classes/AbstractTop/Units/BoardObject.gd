class_name BoardObject extends Unit

@export var health := -1; ## -1 for none.
@export var maximum_health := health; ## Default is health
@export var passive : Passive;
@export var solid := true; ## Can people walk through this?
@export var moveable := false; 

func recieve_trigger(which: Enums.Trigger, context: EffectCallable.EffectContext):
	passive.recieve_trigger(which,context);
