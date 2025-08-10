class_name Hoe 
extends CharacterBody2D

var moneyScene = preload("res://scenes/money.tscn")

@export var stats: Stats
@export var servingTime: float = 8.1
@export var servingScoreTime: float = 2
@onready var statsWindowSpawner: StatsWindowSpawner = $StatsWindowSpawner
@onready var selectable: Selectable = $Selectable
@onready var path: Path2D = $Path2D
@onready var pathToFollow: PathsToFollowForJohns = $Path2D/PathFollow2D

var animatedSpriteMoney: AnimatedSprite2D
var servingTimer: Timer
var servingScoreTimer: Timer

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
	add_child(getServingTimer())
	add_child(getServingScoreTimer())


func finishServing() -> void:
	print("finishing serving")
	despawnServingScoreTimer()
	despawnServingTimer()
	despawnMoneyIcon()

func spawnMoneyIcon() -> void:
	animatedSpriteMoney = moneyScene.instantiate()
	animatedSpriteMoney.position += Vector2(0,-8)
	add_child(animatedSpriteMoney)
	

func despawnMoneyIcon() -> void:
	animatedSpriteMoney.visible = false
	animatedSpriteMoney.queue_free()
	animatedSpriteMoney = null
	
func getServingScoreTimer() -> Timer:
	if(servingScoreTimer!=null):
		return servingScoreTimer
	
	servingScoreTimer = Timer.new()
	servingScoreTimer.wait_time = servingScoreTime
	servingScoreTimer.one_shot = false
	servingScoreTimer.autostart = true
	servingScoreTimer.timeout.connect(score)
	return servingScoreTimer


func getServingTimer() -> Timer:
	if(servingTimer!=null):
		return servingTimer
	
	servingTimer = Timer.new()
	servingTimer.wait_time = servingTime
	servingTimer.one_shot = true
	servingTimer.autostart = true
	servingTimer.timeout.connect(finishServing)
	return servingTimer
	
func despawnServingTimer() -> void:
	servingTimer.queue_free()
	servingScoreTimer = null


func despawnServingScoreTimer() -> void:
	servingScoreTimer.queue_free()
	servingScoreTimer = null

func score() -> void:
	var client = selectable.matchedWith as John
	#client.st
	print("Scored!")
	
