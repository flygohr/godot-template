# Script to store the game data that will end into a savefile and are needed to run the game
# Kept separate from the SaveManager for compartimentalization

extends Node

const GAME_VERSION: float = 0.1

const KEY_GAME_VERSION: String = "game version"

const DEFAULT_GAME_DATA: Dictionary = {
	KEY_GAME_VERSION: GAME_VERSION
}
