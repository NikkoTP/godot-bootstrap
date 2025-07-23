class_name John 
extends CharacterBody2D

const speed: float = 1

@export var stats: Stats

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
