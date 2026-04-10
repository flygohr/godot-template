extends Node2D

const TITLE_SCREEN_SCENE: StringName = ScenesConstants.SCENE_PATHS[ScenesConstants.KEY_TITLE_SCREEN]
const SETTINGS_SCREEN_SCENE: StringName = ScenesConstants.SCENE_PATHS[ScenesConstants.KEY_SETTINGS_SCREEN]
@onready var popup_2: Button = $UI/Popup2

func _ready() -> void:	
	GameData.is_in_game = true
	GameData.initiate_load_game_data()
	GameData.current[GameData.KEY_IS_NEW_GAME] = false
	GameData.initiate_save_game_data()

func _on_settings_button_pressed() -> void:
	ScenesManager.load_scene(SETTINGS_SCREEN_SCENE)
	
func _on_popup_1_pressed() -> void:
	PopupManager.show_popup_confirmation("Testing the popup")
	await PopupManager.yes_button_pressed
	popup_2.show()

func _on_popup_2_pressed() -> void:
	PopupManager.show_popup_dialog("Testing the dialog, part 1")
	await PopupManager.next_button_pressed
	PopupManager.show_popup_dialog("Testing the dialog, part 2", "Continue")
