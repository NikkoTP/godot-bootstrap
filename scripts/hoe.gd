class_name Client 
extends CharacterBody2D

@export var stats: Stats

var statsWindowScene = preload("res://scenes/stats_window.tscn")

var statsWindow: StatsWindow


func _ready() -> void:
	pass


func _mouse_enter() -> void:
	if(statsWindow==null):
		statsWindow = statsWindowScene.instantiate()
		statsWindow.stats = self.stats
		add_child(statsWindow)
	else:
		statsWindow.visible = true


func _mouse_exit() -> void:
	statsWindow.visible = false
