class_name Selectable
extends Node2D

signal selected(character: CharacterBody2D)
signal deselected

var selectedIconScene = preload("res://scenes/selected_icon.tscn")
var selectedIcon: AnimatedSprite2D

var isHovered = false
var isSelected = false


func select(event: InputEvent, character: CharacterBody2D) -> void:
	if(not event.is_action_pressed("select")):
		return
	
	print("in Selectable.select(...)")
	get_tree().root.set_input_as_handled()
	selected.emit(character)
	
	

func deselect() -> void:
	isSelected = false
	despawnSelectedIcon()
	deselected.emit()
	
func confirmSelected() -> void:
	isSelected = true
	spawnSelectedIcon()

func spawnSelectedIcon() -> void:
	selectedIcon = selectedIconScene.instantiate()
	selectedIcon.transform.origin += Vector2(0,-15)
	add_child(selectedIcon)


func despawnSelectedIcon() -> void:
	print("despawing selected icon")
	selectedIcon.visible = false
	selectedIcon.stop()
	selectedIcon.queue_free()
	selectedIcon = null
