class_name John 
extends CharacterBody2D

const speed: float = 1

@export var stats: Stats

@onready var statsWindowSpawner: StatsWindowSpawner = $StatsWindowSpawner

var moving: bool = false
var destination: Area2D

func _process(delta: float) -> void:
	if(moving):
		moveToDestination(delta)


func moveToDestination(delta: float) -> void:
	var currentPos = self.transform.origin
	var vectorToMove = destination.transform.origin - currentPos
	self.position += vectorToMove * delta * speed


func moveToNextFreeQueueSpot(destination: Area2D) -> void:
	moving = true
	self.destination = destination

func _mouse_enter() -> void:
	statsWindowSpawner.showStatsWindow(stats)


func _mouse_exit() -> void:
	statsWindowSpawner.hideStatsWindow()
