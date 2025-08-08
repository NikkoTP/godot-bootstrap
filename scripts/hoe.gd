class_name Hoe 
extends CharacterBody2D

@export var stats: Stats
@onready var statsWindowSpawner: StatsWindowSpawner = $StatsWindowSpawner
@onready var selectable: Selectable = $Selectable
@onready var path: Path2D = $Path2D
@onready var pathToFollow: PathsToFollowForJohns = $Path2D/PathFollow2D

func _ready() -> void:
	pathToFollow.finishedPath.connect(johnReachedHoe)
	pass


func _mouse_enter() -> void:
	statsWindowSpawner.showStatsWindow(stats)
	selectable.isHovered = true


func _mouse_exit() -> void:
	statsWindowSpawner.hideStatsWindow()
	selectable.isHovered = false


#func _unhandled_input(event: InputEvent) -> void:
	#selectable.select(event,self)

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	selectable.select(event, self)

func johnReachedHoe() -> void:
	serveJohn()
	pass
	

func serveJohn() -> void:
	print("serving hoe")
	pass
