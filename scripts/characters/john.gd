class_name John 
extends Character

const speed: float = 100

signal stoppedMoving(john: John)

@export var basePayRate: float = 1

@onready var stateMachine: StateMachine = $StateMachine
@onready var stateWalkingToPath: State = $StateMachine/WalkingToPath
@onready var stateWalkingToHoe: State = $StateMachine/WalkingToHoe
@onready var stateGettingServed: State = $StateMachine/GettingServed

var hasUnreachedDestination: bool = false
var destination: Vector2

func _ready() -> void:
	stateMachine.init(self)

func _process(delta: float) -> void:
	stateMachine.process_frame(delta)


func moveToNextDestination(destination: Vector2) -> void:
	hasUnreachedDestination = true
	self.destination = destination

func _mouse_enter() -> void:
	stateMachine.mouse_enter()


func _mouse_exit() -> void:
	stateMachine.mouse_exit()


func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	stateMachine.process_input(event)
