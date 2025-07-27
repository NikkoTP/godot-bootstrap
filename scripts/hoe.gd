class_name Hoe 
extends CharacterBody2D

@export var stats: Stats
@onready var statsWindowSpawner: StatsWindowSpawner = $StatsWindowSpawner
@onready var selectable: Selectable = $Selectable

func _ready() -> void:
	pass


func _mouse_enter() -> void:
	statsWindowSpawner.showStatsWindow(stats)


func _mouse_exit() -> void:
	statsWindowSpawner.hideStatsWindow()




func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	selectable.select(viewport,event,shape_idx)
