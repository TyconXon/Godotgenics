extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	var curgame = Game.new();
	var curplayer = Player.new();
	var onlycat = load("res://Data/Testing/Ness.tres");
	curplayer.adventure_mainteam.append(onlycat)
	curgame.players.append(curplayer)
	Global.current_game = curgame
	get_tree().change_scene_to_file("res://Scenes/AdventureMap.tscn")
	pass
