extends Node2D

const INITIAL_SCENE: StringName = ScenesConstants.SCENE_PATHS[ScenesConstants.KEY_GAME_SCREEN]
const SETTINGS_SCENE: StringName = ScenesConstants.SCENE_PATHS[ScenesConstants.KEY_SETTINGS_SCREEN]

func _on_play_button_pressed() -> void:
	ScenesManager.load_scene(INITIAL_SCENE)

func _on_options_button_pressed() -> void:
	ScenesManager.load_scene(SETTINGS_SCENE)
