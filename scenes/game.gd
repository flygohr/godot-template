extends Node2D

const TITLE_SCREEN_SCENE: StringName = ScenesConstants.SCENE_PATHS[ScenesConstants.KEY_TITLE_SCREEN]

func _on_button_pressed() -> void:
	ScenesManager.load_scene(TITLE_SCREEN_SCENE)
