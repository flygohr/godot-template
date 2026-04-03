# Script to handle save and load functions
# Following this tutorial: https://youtu.be/R-rALRlgbe8?is=vqL5IG8YR2DzgIrE
# And expanding on it

extends Node

const SAVES_DIRECTORY: String = "saves"
const SLOT_DIRECTORY_NAME: String = "slot_"
const SAVE_NAME: String = "save.json"

var mockup_save_data: Dictionary = {
		"test name": "abcdefg",
		"test int": 14,
		"test vec3": Vector3(1,2,3),
		"test vec2": Vector2(1,2),
		"test color": Color.ALICE_BLUE
	}

var default_save_data: Dictionary = {
		"test name": "hijklmno",
		"test int": 41,
		"test vec3": Vector3(4,5,6),
		"test vec2": Vector2(3,4),
		"test color": Color.GREEN_YELLOW
	}

func _ready() -> void:	
	save_game(mockup_save_data)
	load_save(mockup_save_data, default_save_data)

# Feed this a dictionary of data and a number for the slot to save in
func save_game(game_data: Dictionary, slot: int = 1) -> void:
	
	# Checking if the saves directory exists, and if not, creating it
	var file_path: String = str("user://",SAVES_DIRECTORY,"/",SLOT_DIRECTORY_NAME,slot,"/")
	check_saves_directory(file_path)
	
	var save_file: String = str(file_path, SAVE_NAME)
	
	# Accessing the save file and writing to it
	print(str("Accessing save file at: ", save_file))
	var opened_file: FileAccess = FileAccess.open(save_file, FileAccess.WRITE)
	if opened_file == null:
		push_error("Error opening file at ", save_file, ", error: ", FileAccess.get_open_error())
		return
		
	#TODO: Write to a .tmp file first
	game_data.sort()
	print(str("Converting this data to JSON: ", game_data))
	for key in game_data:
		match typeof(game_data[key]):
			TYPE_VECTOR2: game_data[key] = _vec2_to_dict(game_data[key])
			TYPE_VECTOR3: game_data[key] = _vec3_to_dict(game_data[key])
			TYPE_COLOR: game_data[key] = _color_to_dict(game_data[key]) # https://forum.godotengine.org/t/save-color-to-json-file/13745/2
	var json_string = JSON.stringify(game_data)
	print(str("The converted data looks like this: ", json_string))
	opened_file.store_line(json_string)
	opened_file.close()

# Load the save from a slot, modify the game data that has been passed in reference, resort to default data if missing
func load_save(game_data: Dictionary, defaults: Dictionary, slot: int = 1) -> void:
	
	# Checking if the saves directory exists, and if not, creating it
	var file_path: String = str("user://",SAVES_DIRECTORY,"/",SLOT_DIRECTORY_NAME,slot,"/")
	check_saves_directory(file_path)
	
	var save_file: String = str(file_path, SAVE_NAME)
	if FileAccess.file_exists(save_file):
		print("Now loading game data")
		var opened_file: FileAccess = FileAccess.open(save_file, FileAccess.READ)
		var string_data: String = opened_file.get_line()
		print(str("Loaded game data is: ", string_data))
		var json = JSON.new()
		if json.parse(string_data) == OK:
			game_data = json.get_data()
			for key in game_data:
				if typeof(game_data[key]) == TYPE_DICTIONARY and game_data[key].has("type") == true:
					print(key)
					match game_data[key]["type"]:
						"Vector2": game_data[key] = _dict_to_vec2(game_data[key])
						"Vector3": game_data[key] = _dict_to_vec3(game_data[key])
						"Color": game_data[key] = _dict_to_color(game_data[key])
			opened_file.close()
			game_data.sort()
			print(str("Parsed loaded data now is: ", game_data))
		opened_file.close()
	else:
		game_data = defaults.duplicate_deep()
		
	
func check_saves_directory(file_path: String):
	# Checking if the saves directory exists, and if not, creating it
	if DirAccess.dir_exists_absolute(file_path) == false:
		print(str("Saves directory doesn't exist yet, creating it at: ", file_path))
		DirAccess.make_dir_recursive_absolute(file_path)
	print(str("Accessing saves directory at: ", file_path))

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


# Functions to handle Variants unsupported by JSON
# Stored as dictionaries and recognized by key "type" : "Variant"

func _vec3_to_dict(v: Vector3) -> Dictionary:
	return {"type": "Vector3", "x": v.x, "y": v.y, "z": v.z}
	
func _dict_to_vec3(d: Dictionary) -> Vector3:
	return Vector3(
		d.get("x", 0.0),
		d.get("y", 0.0),
		d.get("z", 0.0)
	)
	
func _vec2_to_dict(v: Vector2) -> Dictionary:
	return {"type": "Vector2", "x": v.x, "y": v.y}
	
func _dict_to_vec2(d: Dictionary) -> Vector2:
	return Vector2(
		d.get("x", 0.0),
		d.get("y", 0.0)
	)

func _color_to_dict(c: Color) -> Dictionary:
	return {"type": "Color", "html": c.to_html()}
	
func _dict_to_color(d: Dictionary) -> Color:
	return Color(d["html"])
