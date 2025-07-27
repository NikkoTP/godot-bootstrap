class_name Hoe 
extends CharacterBody2D

@export var stats: Stats
@onready var statsWindowSpawner: StatsWindowSpawner = $StatsWindowSpawner

func _ready() -> void:
	pass


func _mouse_enter() -> void:
	statsWindowSpawner.showStatsWindow(stats)


func _mouse_exit() -> void:
	statsWindowSpawner.hideStatsWindow()
