extends Node2D

@export var current_map : MapLayout;

@onready var party_icon : Node2D = preload("uid://bshn3q8wodvoi").instantiate()
var current_node := 0;
var current_path := 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(party_icon)
	party_icon.position = (current_map.pathing.get(0) as PathSegment).get_point_position(current_node)
	for i in current_map.pathing.values():
		var thisnode = Line2D.new()
		add_child(thisnode)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = Global.teamcats(0)[0].display_name + " " + str(Global.teamcats(0)[0].stats)
	if (Input.is_action_just_released("ui_focus_next")):
		var curpath = (current_map.pathing.get(current_path) as PathSegment);
		current_node += 1
		if (curpath.point_count <= current_node):
			current_node = 0;
			current_path += 1;
			curpath = (current_map.pathing.get(current_path) as PathSegment);
		party_icon.position = curpath.get_point_position(current_node)
		
