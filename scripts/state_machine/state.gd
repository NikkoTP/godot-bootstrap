class_name State
extends Node

var character: Character


func init(character: Character) -> void:
	self.character = character
	
	
func enter() -> void:
	pass
	
func exit() -> void:
	pass

func mouse_enter() -> void:
	pass
	

func mouse_exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null
	
func process_frame(delta: float) -> State:
	return null
	
func process_physics(delta:float) -> State:
	return null
