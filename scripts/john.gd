class_name John 
extends CharacterBody2D

const speed: float = 1

@export var stats: Stats

@onready var statsWindowSpawner: StatsWindowSpawner = $StatsWindowSpawner
@onready var selectable: Selectable = $Selectable

var moving: bool = false
var destination: Vector2

func _process(delta: float) -> void:
	if(moving):
		_moveToDestination(delta)


func _moveToDestination(delta: float) -> void:
	var currentPos = self.global_position
	if(currentPos == destination):
		moving = false
		return
	var vectorToMove = destination - currentPos
	self.position += vectorToMove * delta * speed
	

func moveToNextDestination(destination: Vector2) -> void:
	moving = true
	self.destination = destination

func _mouse_enter() -> void:
	print("john mouse enter")
	statsWindowSpawner.showStatsWindow(stats)
	selectable.isHovered = true


func _mouse_exit() -> void:
	print("Johne mouse exit")
	statsWindowSpawner.hideStatsWindow()
	selectable.isHovered = false


#func _unhandled_input(event: InputEvent) -> void:
	#selectable.select(event,self)

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	selectable.select(event, self)
