# Script to store the game data that will end into a savefile and are needed to run the game
# Kept separate from the SaveManager for compartimentalization

extends Node

const GAME_NAME: String = "Godot Jam Template"
const GAME_VERSION: String = "0.1"

# GAME DATA
# Variables to keep track of during gameplay
var active_save_slot: int = 1
var is_in_game: bool = false # Track if in game for settings menu options
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
		"test textedit": ""
	}

func _ready() -> void:
	SavesManager.load_save(current, active_save_slot)

func initiate_load_game_data() -> void:
	SavesManager.load_save(current, active_save_slot)

func initiate_save_game_data() -> void:
	SavesManager.save_game(current, active_save_slot)
