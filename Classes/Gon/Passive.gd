class_name Passive extends Resource



enum passive_reason{
	FromAPassiveAbility, FromAStatus, FromASpell, FromAnItem, FromMutation, FromClass, FromOther
}

@export var whatReasonDoIHave : passive_reason;
@export var stat_modifiers : Dictionary[Enums.Stats, int]
@export var tag_immunities : Array[StringName] ## Tag system

@export var whatDoIDoWhen: Dictionary[Enums.Trigger,EffectCallableList];
@export var whatIDoWhenOthersDo: Dictionary[Enums.Trigger, EffectCallableList];

func recieve_trigger(which: Enums.Trigger, context: EffectCallable.EffectContext):
	if context.overheard == false:
		if whatDoIDoWhen.has(which) :
			var efl = (whatDoIDoWhen.get(which) as EffectCallableList);
			efl.reason = which;
			for script: GDScript in efl.callables:
				script.call("execute",context)
	else:
		if whatIDoWhenOthersDo.has(which) :
			var efl = (whatIDoWhenOthersDo.get(which) as EffectCallableList);
			efl.reason = which;
			for script: GDScript in efl.callables:
				script.call("execute",context)
