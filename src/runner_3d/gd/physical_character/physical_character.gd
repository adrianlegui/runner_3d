class_name PhysicalCharacter extends CharacterBody3D

var _character: Character


func set_character(character: Character) -> void:
	_character = character
	transform.origin = _character.get_position()


func get_character() -> Character:
	return _character
