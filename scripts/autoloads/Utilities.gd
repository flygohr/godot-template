# Generic formulas and functions for my project
# Need to stringify and convert Vector2 and Vector3, as well as colors I think

extends Node

func _vec3_to_dict(v: Vector3) -> Dictionary:
	return {"x": v.x, "y": v.y, "z": v.z}
	
func _dict_to_vec3(d: Dictionary) -> Vector3:
	return Vector3(
		d.get("x", 0.0),
		d.get("y", 0.0),
		d.get("z", 0.0)
	)
	
func _vec2_to_dict(v: Vector2) -> Dictionary:
	return {"x": v.x, "y": v.y}
	
func _dict_to_vec2(d: Dictionary) -> Vector2:
	return Vector2(
		d.get("x", 0.0),
		d.get("y", 0.0)
	)

# TODO: HEX color to string and viceversa
