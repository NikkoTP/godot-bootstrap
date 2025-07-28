class_name StatsWindowSpawner 
extends Node

var statsWindowScene = preload("res://scenes/stats_window.tscn")
var statsWindow: StatsWindow


func showStatsWindow(stats: Stats) -> void:
	statsWindow = statsWindowScene.instantiate()
	statsWindow.stats = stats
	add_child(statsWindow)



func hideStatsWindow() -> void:
	statsWindow.visible = false
	statsWindow.queue_free()
	statsWindow = null
