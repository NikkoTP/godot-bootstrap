class_name Queued
extends State

func process_frame(delta: float) -> State:
	_moveToDestination(delta)
	return null
	
func process_input(event: InputEvent) -> State:
	character.selectable.select(event, character)
	return null
	
	
func _moveToDestination(delta: float) -> void:
	var currentPos = character.global_position
	if(currentPos.distance_to(character.destination) < 1):
		character.hasUnreachedDestination = false
		character.stoppedMoving.emit(character)
		return
	var vectorToMove = character.destination - currentPos
	vectorToMove = vectorToMove.normalized()
	character.position += vectorToMove * delta * character.speed
	
