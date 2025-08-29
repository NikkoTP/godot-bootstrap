class_name State
extends Node

var character: CharacterBody2D


func init(character: CharacterBody2D) -> void:
	self.character = character
	
	
func enter() -> void:
	pass
	
func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null
	
func process_frame(delta: float) -> State:
	return null
	
func process_physics(delta:float) -> State:
	return null
