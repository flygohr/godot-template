extends Node2D

const TITLE_SCREEN_SCENE: StringName = ScenesConstants.SCENE_PATHS[ScenesConstants.KEY_TITLE_SCREEN]
const GAME_SCREEN_SCENE: StringName = ScenesConstants.SCENE_PATHS[ScenesConstants.KEY_GAME_SCREEN]

var scene_to_back_to: StringName = TITLE_SCREEN_SCENE

@onready var music_slider_value: Label = $CanvasLayer/MarginContainer/VBoxContainer/MusicSliderContainer/MusicSliderValue
@onready var sfx_slider_value: Label = $CanvasLayer/MarginContainer/VBoxContainer/SFXSliderContainer/SFXSliderValue
@onready var full_screen_check_button: CheckButton = $CanvasLayer/MarginContainer/VBoxContainer/FullScreenToggle/FullScreenCheckButton
@onready var quit_button: Button = $CanvasLayer/MarginContainer/VBoxContainer/QuitButton

func _ready() -> void:
	RenderingServer.set_default_clear_color(Color.DARK_GOLDENROD)
	
	# Settings menu to look different depending on if in game or not
	if GameData.is_in_game == true:
		scene_to_back_to = GAME_SCREEN_SCENE
		quit_button.show()
	else: scene_to_back_to = TITLE_SCREEN_SCENE
	
	# Sets the toggle button for fullscreen to its correct value upon loading
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN: full_screen_check_button.button_pressed = true
	else: full_screen_check_button.button_pressed = false

func _on_back_button_pressed() -> void:
	ScenesManager.load_scene(scene_to_back_to)

func _on_export_save_button_pressed() -> void:
	SavesManager.export_save(GameData.current, GameData.GAME_NAME, GameData.GAME_VERSION, GameData.active_save_slot)

func _on_import_save_button_pressed() -> void:
	SavesManager.import_save(GameData.current, GameData.active_save_slot)

func _on_check_button_toggled(button_pressed: bool) -> void:
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_quit_button_pressed() -> void:
		ScenesManager.load_scene(TITLE_SCREEN_SCENE)

func _on_music_slider_value_changed(value: float) -> void:
	music_slider_value.text = (str(int(value),"%"))

func _on_sfx_slider_value_changed(value: float) -> void:
	sfx_slider_value.text = (str(int(value),"%"))
