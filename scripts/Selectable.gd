class_name Selectable
extends Node

signal selected
signal deselected

var isSelected = false


func select(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if(event is InputEventMouseButton
	and event.is_pressed() 
	and (event as InputEventMouseButton).button_index == MOUSE_BUTTON_LEFT):
		print("Is selected")
		selected.emit()



func confirmSelected() -> void:
	isSelected = true


func deselect() -> void:
	isSelected = false
	deselected.emit()
