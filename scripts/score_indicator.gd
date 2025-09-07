class_name ScoreIndicator
extends Node2D

@onready var label: Label = $PanelContainer/Label

@export var directionLimit: float = 8

@export var speed: float = 0.5

@export var direction: Vector2 = Vector2.UP

@export var prefix: String

@export var spawnTransform: Vector2

var originalPos: Vector2

var scoreEarned: float = 0






func _ready() -> void:
	label.text = prefix + " " + str(scoreEarned)
	self.global_position += spawnTransform
	originalPos = self.global_position
	
	

func _process(delta: float) -> void:
	if(isWhithinBoundraries()):
		self.position += direction * speed
	else:
		self.queue_free()
	
	
	

func isWhithinBoundraries() -> bool:
	var currentYCord: float = self.global_position.y
	var originYCord: float = originalPos.y
	
	var deltaVec2 = self.global_position - originalPos
	
	return deltaVec2.length() < directionLimit
