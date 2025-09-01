class_name ScoreBoard
extends Control

@onready var label = $PanelContainer/Label

var score: float = 0

func scored(amount: float) -> void:
	score += amount
	label.text = "$ " + str(score)
