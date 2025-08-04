extends PathFollow2D

@export var speed: float = 0.4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(hasJohnOnPath()):
		progress_ratio += delta * speed
	
func hasJohnOnPath() -> bool:
	return get_child_count() > 0
