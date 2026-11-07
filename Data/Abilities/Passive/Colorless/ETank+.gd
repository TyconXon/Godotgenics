extends EffectCallable
func execute(context:EffectContext) -> Variant:
	context.me.flat_max_health += 50;
	return context.value;
