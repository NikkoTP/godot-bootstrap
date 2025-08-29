extends State


func process_input(event: InputEvent) -> State:
	character.selectable.select(event,character)
	return null
