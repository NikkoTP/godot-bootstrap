extends Queued

# Overriden to disable selection input, once the walk has started.
func process_input(event: InputEvent) -> State:
	return null
