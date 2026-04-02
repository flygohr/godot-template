extends Node2D

var title_screen_scene: StringName = ScenesConstants.SCENE_PATHS[ScenesConstants.KEY_TITLE_SCREEN]

func _on_back_button_pressed() -> void:
	ScenesManager.load_scene(title_screen_scene)
