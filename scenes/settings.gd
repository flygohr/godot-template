extends Node2D

const TITLE_SCREEN_SCENE: StringName = ScenesConstants.SCENE_PATHS[ScenesConstants.KEY_TITLE_SCREEN]
const GAME_SCREEN_SCENE: StringName = ScenesConstants.SCENE_PATHS[ScenesConstants.KEY_GAME_SCREEN]

func _on_back_button_pressed() -> void:
	ScenesManager.load_scene(TITLE_SCREEN_SCENE)

func _on_export_save_button_pressed() -> void:
	SavesManager.export_save(GameData.current, GameData.GAME_NAME, GameData.GAME_VERSION, GameData.active_save_slot)

func _on_import_save_button_pressed() -> void:
	SavesManager.import_save(GameData.current, GameData.active_save_slot)

func _on_back_to_game_button_pressed() -> void:
	ScenesManager.load_scene(GAME_SCREEN_SCENE)
