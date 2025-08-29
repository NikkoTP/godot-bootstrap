class_name Hoe 
extends Character

var moneyScene = preload("res://scenes/money.tscn")

@export var servingTime: float = 8.1
@export var servingScoreTime: float = 2
@export var staminaCostFactor: float = 0.003
@export var revenueCut: float = 0.4
@onready var path: Path2D = $Path2D
@onready var pathToFollow: PathsToFollowForJohns = $Path2D/PathFollow2D

var animatedSpriteMoney: AnimatedSprite2D
var servingTimer: Timer
var servingScoreTimer: Timer

func _ready() -> void:
	pathToFollow.finishedPath.connect(johnReachedHoe)
	pass


func _mouse_enter() -> void:
	print("hoe mouse enter")
	statsWindowSpawner.showStatsWindow(stats)
	selectable.isHovered = true


func _mouse_exit() -> void:
	print("hoe mouse exit")
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
	despawnServedJohn()

func spawnMoneyIcon() -> void:
	animatedSpriteMoney = moneyScene.instantiate()
	animatedSpriteMoney.position += Vector2(0,-8)
	add_child(animatedSpriteMoney)
	

func despawnMoneyIcon() -> void:
	animatedSpriteMoney.visible = false
	animatedSpriteMoney.queue_free()
	animatedSpriteMoney = null
	
func despawnServedJohn() -> void:
	var john = self.selectable.matchedWith as John
	john.visible = false
	john.queue_free()
	
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
	var compareResult = self.stats.compareTo(client.stats)
	var scored = calculateScore(client.basePayRate,compareResult)
	print("Scored: " + str(scored))
	
func calculateScore(basePayRate: float, compareResult: Stats) -> float:
	var score: float = 0
	score += calculateScoreOrApplyStaminaCostForSingleStat(basePayRate,compareResult.talk)
	score += calculateScoreOrApplyStaminaCostForSingleStat(basePayRate,compareResult.romance)
	score += calculateScoreOrApplyStaminaCostForSingleStat(basePayRate,compareResult.party)
	score += calculateScoreOrApplyStaminaCostForSingleStat(basePayRate,compareResult.sports)
	
	#score = calculateScoreOrApplyStaminaCostForSingleNatureStat(score,compareResult.cuteToHot)
	#score = calculateScoreOrApplyStaminaCostForSingleNatureStat(score,compareResult.subToDom)
	
	score = applyRevenueCut(score)
	return score

func calculateScoreOrApplyStaminaCostForSingleStat(basePayRate: float, statValue: float) -> float:
	print("statValue diff is: " + str(statValue))
	if(statValue >= 0):
		return basePayRate * statValue
	else:
		applyStaminaCost(statValue)
		return 0

func calculateScoreOrApplyStaminaCostForSingleNatureStat(score: float, statValue: float) -> float:
	return 0
	
func applyRevenueCut(score: float) -> float:
	return score * (1-revenueCut)

func applyStaminaCost(statDiff: float) -> void:
	self.stats.stamina -= abs(statDiff)*staminaCostFactor
	print("applied stamina penalty. New stamina value: " + str(self.stats.stamina))
