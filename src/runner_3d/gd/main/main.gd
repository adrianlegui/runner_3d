extends Node


func _ready() -> void:
	get_tree().paused = true
	EnteModManager.start()
	await EnteModManager.finished

	var failed_mods := EnteModManager.get_failed_mods()
	var failed_pck := EnteModManager.get_failed_pcks()

	if not failed_mods.is_empty() or not failed_pck.is_empty():
		print("failed mods: %s\nfailed pcks: %" % [failed_mods, failed_pck])
		get_tree().quit()

	var savegame_path: String = EnteModManager.get_path_to_savegame(Runner3DConst.SAVEGAME_NAME)

	if FileAccess.file_exists(savegame_path):
		EnteModManager.load_savegame(Runner3DConst.SAVEGAME_NAME)
	else:
		EnteModManager.start_game()

	await EnteModManager.started_game
	get_tree().paused = false
	queue_free()
