class_name Hoe 
extends CharacterBody2D

var moneyScene = preload("res://scenes/money.tscn")

@export var stats: Stats
@onready var statsWindowSpawner: StatsWindowSpawner = $StatsWindowSpawner
@onready var selectable: Selectable = $Selectable
@onready var path: Path2D = $Path2D
@onready var pathToFollow: PathsToFollowForJohns = $Path2D/PathFollow2D

var animatedSpriteMoney: AnimatedSprite2D
var simulationTimer: Timer

func _ready() -> void:
	pathToFollow.finishedPath.connect(johnReachedHoe)
	pass


func _mouse_enter() -> void:
	statsWindowSpawner.showStatsWindow(stats)
	selectable.isHovered = true


func _mouse_exit() -> void:
	statsWindowSpawner.hideStatsWindow()
	selectable.isHovered = false


func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	selectable.select(event, self)

func johnReachedHoe() -> void:
	serveJohn()
	pass
	

func serveJohn() -> void:
	print("serving hoe")
	spawnMoneyIcon()
	simulationTimer = Timer.new()
	simulationTimer.wait_time = 5
	simulationTimer.one_shot = true
	simulationTimer.autostart = true
	simulationTimer.timeout.connect(finishServing)
	add_child(simulationTimer)


func finishServing() -> void:
	print("finishing serving")
	simulationTimer.queue_free()
	simulationTimer = null
	despawnMoneyIcon()

func spawnMoneyIcon() -> void:
	animatedSpriteMoney = moneyScene.instantiate()
	animatedSpriteMoney.position += Vector2(0,-8)
	add_child(animatedSpriteMoney)
	

func despawnMoneyIcon() -> void:
	animatedSpriteMoney.visible = false
	animatedSpriteMoney.queue_free()
	animatedSpriteMoney = null
	
