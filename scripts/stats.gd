class_name Stats extends Node

# skill stats
@export_group("Skill Stats")
@export_range(0,100) var stamina: int = 100
@export_range(0,100) var talk: int = 0
@export_range(0,100) var romance: int = 0
@export_range(0,100) var party: int = 0
@export_range(0,100) var sports: int = 0

# nature stats
@export_group("Nature Stats")
@export_range(-1,1) var subToDom: float = 0
@export_range(-1,1) var cuteToHot: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
