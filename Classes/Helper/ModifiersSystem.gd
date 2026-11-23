class_name ModifiersSystem extends Resource
var data : Dictionary[String,Modifier]
var max_id := 0;

func get_attribute(attr: String, base:float) -> float:
	var fltrd = data.values().filter(func(modeth:Modifier):return modeth.to == attr);
	var working_number = base;
	for a:Modifier in fltrd:
		if a.opp == Modifier.operations.MultiplyBase:
			working_number *= a.val
	for a:Modifier in fltrd:
		if a.opp == Modifier.operations.Add:
			working_number += a.val
	for a:Modifier in fltrd:
		if a.opp == Modifier.operations.MultiplyAfter:
			working_number *= a.val
	return working_number;

func add_modifier(id:String,mod: Modifier):
	return data.set(id, mod)

func del_modifier(id:String):
	return data.erase(id);
	
func clear_attribute(attr: String):
	for a in data.keys():
		if data[a].to == attr:
			data.erase(a)
			
func clear_source(source: String):
	for a in data.keys():
		if data[a].from == source:
			data.erase(a)

class Modifier:
	var from : StringName ## A string representing where this is from
	var to : StringName ## Important: A string representing the attribute to modify
	var val : float ## Value to modify it by
	enum operations {Add, MultiplyBase, MultiplyAfter}
	var opp : operations;
