@abstract class_name EffectCallable extends GDScript
@export var name: String;
@abstract func execute(context:EffectContext) -> Variant;

# A record of what should be given to execute, nullable
class EffectContext:
	@export var overheard := false;
	@export var from: Unit;
	@export var to: Unit;
	@export var me: Unit;
	@export var item: Item;
	@export var ability: Ability;
	@export var value: Dictionary; ## This is a referenced value, see: [url]https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html#built-in-types[/url] 
	
	
