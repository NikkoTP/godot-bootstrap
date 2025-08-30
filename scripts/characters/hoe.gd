class_name Hoe 
extends Character

var moneyScene = preload("res://scenes/money.tscn")

@export var servingTime: float = 8.1
@export var servingScoreTime: float = 2
@export var staminaCostFactor: float = 0.003
@export var revenueCut: float = 0.4
@onready var path: Path2D = $Path2D
@onready var pathToFollow: PathsToFollowForJohns = $Path2D/PathFollow2D
@onready var stateMachine: StateMachine = $StateMachine
@onready var stateWaitingForClient: State = $StateMachine/WaitingForClient
@onready var stateServingClient: State = $StateMachine/ServingClient

var animatedSpriteMoney: AnimatedSprite2D
var servingTimer: Timer
var servingScoreTimer: Timer

func _ready() -> void:
	pathToFollow.finishedPath.connect(johnReachedHoe)
	stateMachine.init(self)

func _process(delta: float) -> void:
	stateMachine.process_frame(delta)


func _mouse_enter() -> void:
	stateMachine.mouse_enter()


func _mouse_exit() -> void:
	stateMachine.mouse_exit()


func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	stateMachine.process_input(event)


func johnReachedHoe() -> void:
	stateMachine.changeStateTo(stateServingClient)
	
