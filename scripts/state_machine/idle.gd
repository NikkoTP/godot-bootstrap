extends State

func mouse_over() -> void:
	print("mouse enter")
	character.statsWindowSpawner.showStatsWindow(character.stats)

func mouse_exit() -> void:
	print("hoe mouse exit")
	character.statsWindowSpawner.hideStatsWindow()


func process_input(event: InputEvent) -> State:
	character.selectable.select(event,character)
	return null
