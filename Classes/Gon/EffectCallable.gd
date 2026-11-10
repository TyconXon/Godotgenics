@abstract class_name EffectCallable extends Resource
@export var name: String;
@abstract func execute(context:EffectContext) -> Variant;

# A record of what should be given to execute, nullable
class EffectContext:
	@export var from: Character;
	@export var to: Character;
	@export var me: Character;
	@export var item: Item;
	@export var ability: Ability;
	@export var value: Dictionary; ## This is a referenced value, see: [url]https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html#built-in-types[/url] 
	
	
