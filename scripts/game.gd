extends Node2D

@onready var stage = $Stage
@onready var spawnTimer: Timer = $SpawnTimer

var johnScene = load("res://scenes/john.tscn")

var queue: Array
var johnSpawnPoint: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initSpawnPoint()
	initQueuePositions()
	startRound()
	print(queue)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func initSpawnPoint() -> void:
	var spawnPoint: Node2D = stage.get_node("JohnSpawnPoint")
	self.johnSpawnPoint = spawnPoint.transform.get_origin()

func initQueuePositions() -> void:
	var queuePositionsContainer = stage.get_node("QueuePositions")
	var queuePositions = queuePositionsContainer.get_children()
	for x in queuePositions:
		self.queue.append((x as Node2D).transform.get_origin())


func startRound() -> void:
	startSpawnTimer()

func restartSpawnTimer() -> void:
	spawnTimer.wait_time = randi_range(10, 20)
	spawnTimer.start()

func startSpawnTimer() -> void:
	spawnTimer.wait_time = randi_range(10, 20)
	spawnTimer.timeout.connect(spawnJohn)
	spawnTimer.start()

func spawnJohn() -> void:
	var johnInstance: John = johnScene.instantiate()
	johnInstance.stats = generateRandomStats()
	johnInstance.transform.origin = johnSpawnPoint
	add_child(johnInstance)
	print("A john has spawned")
	restartSpawnTimer()


func generateRandomStats() -> Stats:
	var stats = Stats.new()
	stats.cuteToHot = randf_range(-1,1)
	stats.subToDom = randf_range(-1,1)
	stats.talk = randi_range(0,100)
	stats.romance = randi_range(0,100)
	stats.party = randi_range(0,100)
	stats.sports = randi_range(0,100)
	return stats
