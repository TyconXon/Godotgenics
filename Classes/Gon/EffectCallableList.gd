class_name EffectCallableList
extends Resource

enum action{
	AddStatus, AddTemporaryStatus, AddSelfStatus, AddDamage, AddElement, AddPassive, AddHealth, Other
}

@export var actions: Array[action];
@export var callables: Array[GDScript];
var reason : Enums.Trigger;
