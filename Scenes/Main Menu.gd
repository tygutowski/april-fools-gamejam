extends Control

func _process(_delta):
	if Input.is_action_just_pressed("toggle pause") and $"main menu".visible == false:
		$"main menu".visible = true
		$"stage select".visible = false
		$"options".visible = false

func _ready():
	for node in get_tree().get_nodes_in_group("sfx slider"):
		node.value = Stats.sfx_volume
	for node in get_tree().get_nodes_in_group("music slider"):
		node.value = Stats.music_volume
	set_music_to(Stats.music_volume)
	set_sfx_to(Stats.sfx_volume)
func _on_music_slider_value_changed(value):
	set_music_to(value)
	Stats.music_volume = value

func set_music_to(value):
	for node in get_tree().get_nodes_in_group("music"):
		node.volume_db = linear_to_db(value/8)

func set_sfx_to(value):
	for node in get_tree().get_nodes_in_group("sfx"):
		node.volume_db = linear_to_db(value/8)

func _on_exit_to_desktop_pressed():
	get_tree().quit()

func _on_options_pressed():
	$"main menu".visible = false
	$"stage select".visible = false
	$"options".visible = true

func _on_stage_select_pressed():
	$"main menu".visible = false
	$"stage select".visible = true
	$"options".visible = false

func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level1-1.tscn")

func _on_catacombs_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level1-1.tscn")

func _on_garden_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level2-1.tscn")

func _on_library_pressed():
		get_tree().change_scene_to_file("res://Scenes/Level3-1.tscn")

func _on_forge_pressed():
		get_tree().change_scene_to_file("res://Scenes/Level4-1.tscn")

func _on_back_pressed():
	$"main menu".visible = true
	$"stage select".visible = false
	$"options".visible = false

func _on_stats_pressed():
	pass


func _on_sfx_slider_value_changed(value):
	set_sfx_to(value)
	Stats.sfx_volume = value