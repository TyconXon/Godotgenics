@abstract class_name EffectCallable extends Resource
@export var name: String;
@abstract func execute(context:EffectContext) -> Variant;
	
class EffectContext extends Resource:
	@export var from: Character;
	@export var to: Character;
	@export var me: Character;
	@export var item: Item;
	@export var ability: Ability;
	@export var value: Variant;
	
	
