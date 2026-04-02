# Script to handle save and load functions
# Following this tutorial: https://youtu.be/R-rALRlgbe8?is=vqL5IG8YR2DzgIrE
# And expanding on it

extends Node

const SAVES_PATH: String = "user://saves/"
const SAVE_NAME: String = "save.json"

# Feed this a dictionary of data and a number for the slot to save in (preparing this to be multi-slot)
func save_game(game_data: Dictionary, slot: int = 1) -> void:
	pass

# Load the save from a slot, modify the game data that has been passed in reference
func load_save(game_data: Dictionary, slot: int = 1) -> void:
	pass
	
# Export the save file of a slot using the native file picker for ease of transfer
func export_save(slot: int = 1) -> void:
	pass
	
# Import a save file into a slot, through the native file picker for ease of transfer
func import_save(slot: int = 1) -> void:
	pass

# Verify the save file, see that it matches keys and static typings. Return true if OK, false if not
func verify_save(save_data: Dictionary, base_data: Dictionary) -> bool:
	return true

#TODO: make this independent of the gamedata, just a standalone file that works with dictionaries and returns dictionaries
