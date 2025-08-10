class_name John 
extends CharacterBody2D

const speed: float = 100

signal stoppedMoving(john: John)

@export var stats: Stats
@export var basePayRate: float = 3

@onready var statsWindowSpawner: StatsWindowSpawner = $StatsWindowSpawner
@onready var selectable: Selectable = $Selectable

var moving: bool = false
var destination: Vector2

func _process(delta: float) -> void:
	if(moving):
		_moveToDestination(delta)


func _moveToDestination(delta: float) -> void:
	var currentPos = self.global_position
	if(currentPos.distance_to(destination) < 1):
		moving = false
		stoppedMoving.emit(self)
		return
	var vectorToMove = destination - currentPos
	vectorToMove = vectorToMove.normalized()
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


func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	selectable.select(event, self)
