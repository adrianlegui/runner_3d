extends Node


func _ready() -> void:
	EnteModManager.start()
	await EnteModManager.finished

	var savegame_path: String = EnteModManager.get_path_to_savegame(
		Runner3DConst.SAVEGAME_NAME
	)

	if FileAccess.file_exists(savegame_path):
		EnteModManager.load_savegame(Runner3DConst.SAVEGAME_NAME)
	else:
		EnteModManager.start_game()

	await EnteModManager.started_game
	queue_free()
