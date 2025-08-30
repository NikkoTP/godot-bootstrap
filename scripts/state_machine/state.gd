class_name State
extends Node2D

var character: Character


func init(character: Character) -> void:
	self.character = character
	
	
func enter() -> void:
	pass
	
func exit() -> void:
	pass

func mouse_enter() -> void:
	print("mouse enter")
	character.statsWindowSpawner.showStatsWindow(character.stats)
	

func mouse_exit() -> void:
	print("hoe mouse exit")
	character.statsWindowSpawner.hideStatsWindow()

func process_input(event: InputEvent) -> State:
	return null
	
func process_frame(delta: float) -> State:
	return null
	
func process_physics(delta:float) -> State:
	return null
