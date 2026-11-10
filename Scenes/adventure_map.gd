extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = Global.teamcats(0)[0].display_name + " " + str(Global.teamcats(0)[0].stats)
	pass
