class_name Selectable
extends Node2D

signal selected(character: CharacterBody2D)
signal deselected

var selectedIconScene = preload("res://scenes/selected_icon.tscn")
var selectedIcon: AnimatedSprite2D

var isSelected = false


func select(event: InputEvent, character: CharacterBody2D) -> void:
	if(not event.is_action_pressed("select")):
		return
			
	spawnSelectedIcon()
	selected.emit(character)


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
