extends Node2D

const TITLE_SCREEN_SCENE: StringName = ScenesConstants.SCENE_PATHS[ScenesConstants.KEY_TITLE_SCREEN]
const SETTINGS_SCREEN_SCENE: StringName = ScenesConstants.SCENE_PATHS[ScenesConstants.KEY_SETTINGS_SCREEN]
@onready var text_edit: TextEdit = $CanvasLayer/TextEdit

func _ready() -> void:
	await GameData.initiate_load_game_data()
	text_edit.text = GameData.current["test textedit"]

func _on_settings_button_pressed() -> void:
	ScenesManager.load_scene(SETTINGS_SCREEN_SCENE)
	
func _on_back_button_pressed() -> void:
	ScenesManager.load_scene(TITLE_SCREEN_SCENE)

func _on_temp_save_button_pressed() -> void:
	GameData.initiate_save_game_data()

func _on_text_edit_text_changed() -> void:
	GameData.current["test textedit"] = text_edit.text
