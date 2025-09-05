class_name ScoreEarned
extends Node2D


@onready var label: Label = $PanelContainer/Label

var scoreEarned: float = 0

var heightLimit: float = 8

var originalPos: Vector2

var speed: float = 0.5



func _ready() -> void:
	label.text = "$ " + str(scoreEarned)
	originalPos = self.global_position
	
	

func _process(delta: float) -> void:
	if(isWhithinBoundraries()):
		self.position += Vector2.UP * speed
	else:
		self.queue_free()
	
	
	

func isWhithinBoundraries() -> bool:
	var currentYCord: float = self.global_position.y
	var originYCord: float = originalPos.y
	
	return currentYCord - originYCord < heightLimit
