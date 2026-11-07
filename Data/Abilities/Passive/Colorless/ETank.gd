extends EffectCallable
func execute(context:EffectContext) -> Variant:
	context.me.flat_max_health += 20;
	return context.value;
