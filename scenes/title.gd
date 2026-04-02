extends Node2D

var initial_scene: StringName = ScenesConstants.SCENE_PATHS[ScenesConstants.KEY_GAME_SCREEN]
var settings_scene: StringName = ScenesConstants.SCENE_PATHS[ScenesConstants.KEY_SETTINGS_SCREEN]

func _on_play_button_pressed() -> void:
	ScenesManager.load_scene(initial_scene)

func _on_options_button_pressed() -> void:
	ScenesManager.load_scene(settings_scene)
