# Script to store the game data that will end into a savefile and are needed to run the game
# Kept separate from the SaveManager for compartimentalization

extends Node

const GAME_NAME: String = "Godot Jam Template"
const GAME_VERSION: String = "0.1"

# GAME DATA
# Variables to keep track of during gameplay
var active_save_slot: int = 1

# KEYS
# Strings to organize the data into a Dictionary and later into a JSON
const KEY_GAME_VERSION: String = "game version"

# DEFAULT GAME DATA
# What to load into a new save
const DEFAULT_GAME_DATA: Dictionary = {
	KEY_GAME_VERSION: GAME_VERSION
}

# CURRENT GAME DATA
# Dictionary to load the current state of the game into, and to pass into SavesManager
# Also polling this every time I need to know something
# var current: Dictionary = DEFAULT_GAME_DATA # Defaults to base game data on load

var current: Dictionary = {
		"test name": "abcdefg",
		"test int": 14,
		"test float": 14.75,
		"test bool": false,
		"test vec3": Vector3(1,2,3),
		"test vec2": Vector2(1,2),
		"test color": Color.ALICE_BLUE
	}

func _ready() -> void:	
	SavesManager.save_game(current)
	SavesManager.load_save(current)
