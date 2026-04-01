extends Node2D

var initial_scene: StringName = ScenesConstants.SCENE_PATHS[ScenesConstants.KEY_GAME_SCREEN]

func _on_play_button_pressed() -> void:
	ScenesManager.load_scene(initial_scene)
