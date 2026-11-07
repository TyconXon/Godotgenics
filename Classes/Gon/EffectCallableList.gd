class_name EffectCallableList
extends Resource

enum action{
	AddStatus, AddTemporaryStatus, AddSelfStatus, AddDamage, AddElement, AddPassive, Heal
}

@export var actions: Array[action];
@export var callables: Array[EffectCallable];
var reason : Enums.Trigger;

@abstract class EffectCallable extends Resource:
	@export var name: String;
	@abstract func execute(context:EffectContext) -> Variant;
	
#@Record
class EffectContext extends Resource:
	@export var from: Character;
	@export var to: Character;
	@export var me: Character;
	@export var item: Item;
	@export var ability: Ability;
	@export var value: Variant;
	
	
