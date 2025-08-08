class_name PathsToFollowForJohns 
extends PathFollow2D

signal finishedPath(john: John)

@export var speed: float = 0.4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(hasJohnOnPath()):
		progress_ratio += delta * speed
		if(progress_ratio>=1):
			finishedPath.emit(get_children()[0] as John)
	
	
func hasJohnOnPath() -> bool:
	return get_child_count() > 0
