class_name DayBoard
extends Control

@onready var label: Label = $PanelContainer/Label

var day: int = 0

func _ready() -> void:
	label.text = "Day " + str(day)

func dayEnd() -> void:
	day += 1
	label.text = "Day " + str(day)
