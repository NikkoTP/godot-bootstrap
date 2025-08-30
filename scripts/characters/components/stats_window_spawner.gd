class_name StatsWindowSpawner 
extends Node

var statsWindowScene = preload("res://scenes/stats_window.tscn")
var statsWindow: StatsWindow


func showStatsWindow(stats: Stats) -> void:
	if(statsWindow != null):
		return
	statsWindow = statsWindowScene.instantiate()
	statsWindow.stats = stats
	#statsWindow.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(statsWindow)



func hideStatsWindow() -> void:
	statsWindow.visible = false
	statsWindow.queue_free()
	statsWindow = null
