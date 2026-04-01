extends Node2D

var main_menu_scene: StringName = ScenesConstants.SCENE_PATHS[ScenesConstants.KEY_MAIN_MENU]

func _on_button_pressed() -> void:
	ScenesManager.load_scene(main_menu_scene)
