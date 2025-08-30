class_name StateMachine
extends Node2D

var character: Character

var currentState: State


func init(character: CharacterBody2D) -> void:
	self.character = character
	for child in get_children():
		if(child is State):
			child.init(character)
			if(currentState == null):
				currentState = child


func changeStateTo(state: State) -> void:
	currentState.exit()
	currentState = state
	currentState.enter()
	
	
func process_input(event: InputEvent) -> void:
	var newState = currentState.process_input(event)
	if newState:
		changeStateTo(newState)


func process_frame(delta: float) -> void:
	var newState = currentState.process_frame(delta)
	if newState:
		changeStateTo(newState)
	
	
func process_physics(delta: float) -> void:
	var newState = currentState.process_physics(delta)
	if newState:
		changeStateTo(newState)


func mouse_enter() -> void:
	currentState.mouse_enter()


func mouse_exit() -> void:
	currentState.mouse_exit()
	
	
