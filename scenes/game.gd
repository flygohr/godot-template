extends Node2D

const TITLE_SCREEN_SCENE: StringName = ScenesConstants.SCENE_PATHS[ScenesConstants.KEY_TITLE_SCREEN]
const SETTINGS_SCREEN_SCENE: StringName = ScenesConstants.SCENE_PATHS[ScenesConstants.KEY_SETTINGS_SCREEN]

func _ready() -> void:	
	GameData.is_in_game = true
	GameData.initiate_load_game_data()
	GameData.current[GameData.KEY_IS_NEW_GAME] = false
	GameData.initiate_save_game_data()

func _on_settings_button_pressed() -> void:
	ScenesManager.load_scene(SETTINGS_SCREEN_SCENE)
	
