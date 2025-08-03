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
		
	print("unhadled input select in character perhaps")
	
	if(not clickInCharacterBody(event, character)):
		return
		
	print("unhadled input select is in character confirmed")
	
	spawnSelectedIcon()
	selected.emit(character)
	get_viewport().set_input_as_handled()


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

func clickInCharacterBody(event: InputEvent, character: CharacterBody2D) -> bool:
	var mousPos = (event as InputEventMouseButton).position
	var collisionShape = character.get_node("CollisionShape2D") as CollisionShape2D
	var rect = collisionShape.shape.get_rect()
	return rect.has_point(mousPos)
