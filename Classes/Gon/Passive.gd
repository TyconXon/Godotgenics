class_name Passive extends Resource



enum passive_reason{
	FromAPassiveAbility, FromAStatus, FromASpell, FromAnItem, FromMutation, FromClass, FromOther
}

@export var whatReasonDoIHave : passive_reason;
@export var stat_modifiers : Dictionary[Enums.Stats, int]

@export var whatDoIDoWhen: Dictionary[Enums.Trigger,EffectCallableList];
@export var whatIDoWhenOthersDo: Dictionary[Enums.Trigger, EffectCallableList];
