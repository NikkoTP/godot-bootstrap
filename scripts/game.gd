extends Node2D

@onready var stage = $Stage
@onready var spawnTimer: Timer = $SpawnTimer

var queue: Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initQueuePositions()
	startRound()
	print(queue)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func initQueuePositions() -> void:
	var queuePositionsContainer = stage.get_node("QueuePositions")
	var queuePositions = queuePositionsContainer.get_children()
	for x in queuePositions:
		self.queue.append((x as Node2D).transform.get_origin())


func startRound() -> void:
	startSpawnTimer()


func startSpawnTimer() -> void:
	spawnTimer.wait_time = randi_range(10, 20)
	spawnTimer.timeout.connect(spawnJohn)
	spawnTimer.start()

func spawnJohn() -> void:
	print("A john has spawned")
	startSpawnTimer()
