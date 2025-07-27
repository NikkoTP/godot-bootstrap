class_name Selectable
extends Node2D

signal selected
signal deselected

var selectedIconScene = preload("res://scenes/selected_icon.tscn")
var selectedIcon: AnimatedSprite2D

var isSelected = false


func select(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if(event is InputEventMouseButton
	and event.is_pressed() 
	and (event as InputEventMouseButton).button_index == MOUSE_BUTTON_LEFT):
		print("Is selected")
		spawnSelectedIcon()
		selected.emit()



func deselect() -> void:
	isSelected = false
	despawnSelectedIcon()
	deselected.emit()

func spawnSelectedIcon() -> void:
	selectedIcon = selectedIconScene.instantiate()
	selectedIcon.transform.origin += Vector2(0,-15)
	add_sibling(selectedIcon)


func despawnSelectedIcon() -> void:
	selectedIcon.visible = false
	selectedIcon.queue_free()
	selectedIcon = null
