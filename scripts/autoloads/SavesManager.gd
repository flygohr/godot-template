# Script to handle save and load functions
# Following this tutorial: https://youtu.be/R-rALRlgbe8?is=vqL5IG8YR2DzgIrE
# And expanding on it

extends Node

const SAVES_DIRECTORY: String = "saves"
const SLOT_DIRECTORY_NAME: String = "slot_"
const SAVE_NAME: String = "save.json"

func _ready() -> void:	
	save_game({
		"test name": "abcdefg",
		"test int": 14,
		"test vec3": Vector3(1,2,3),
		"test vec2": Vector2(1,2),
		"test color": Color.ALICE_BLUE
	})

# Feed this a dictionary of data and a number for the slot to save in (preparing this to be multi-slot)
func save_game(game_data: Dictionary, slot: int = 1) -> void:
	
	# Checking if the saves directory exists, and if not, creating it
	var file_path = str("user://",SAVES_DIRECTORY,"/",SLOT_DIRECTORY_NAME,slot,"/")
	if DirAccess.dir_exists_absolute(file_path) == false:
		print(str("Saves directory doesn't exist yet, creating it at: ", file_path))
		DirAccess.make_dir_recursive_absolute(file_path)
	print(str("Accessing saves directory at: ", file_path))
	
	# Accessing the save file and writing to it
	print(str("Accessing save file at: ", file_path, SAVE_NAME))
	var file: FileAccess = FileAccess.open(str("user://",SAVES_DIRECTORY,"/",SLOT_DIRECTORY_NAME,slot,"/",SAVE_NAME), FileAccess.WRITE)
	if file == null:
		push_error("Error opening file at ", file_path, SAVE_NAME, ", error: ", FileAccess.get_open_error())
		return
		
	#TODO: Write to a .tmp file first
	#var json_string = JSON.stringify(game_data)
	#print(json_string)
	#file.store_line(json_string)
	#file.close()

## Load the save from a slot, modify the game data that has been passed in reference
#func load_save(game_data: Dictionary, slot: int = 1) -> void:
	#if FileAccess.file_exists(str(SAVES_PATH,"slot_",slot,"/",SAVE_NAME)):
		#var file: FileAccess = FileAccess.open(str(SAVES_PATH,"slot_",slot,"/",SAVE_NAME), FileAccess.READ)
		#var data: Dictionary = file.get_var()
		#for i in data:
			#if game_data.has(i):
				#game_data[i] = data[i]
		#file.close()
	#
## Export the save file of a slot using the native file picker for ease of transfer
#func export_save(slot: int = 1) -> void:
	#pass
	#
## Import a save file into a slot, through the native file picker for ease of transfer
#func import_save(slot: int = 1) -> void:
	#pass
#
## Verify the save file, see that it matches keys and static typings. Return true if OK, false if not
#func verify_save(save_data: Dictionary, base_data: Dictionary) -> bool:
	#return true

#TODO: make this independent of the gamedata, just a standalone file that works with dictionaries and returns dictionaries
