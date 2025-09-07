class_name StaminaBar
extends ProgressBar

var staminaPenaltyScene = preload("res://scenes/stamina_penalty.tscn")

var stamina: int = 0


func _process(delta: float) -> void:
	self.value = stamina

func updateStamina(newStamina: int) -> void:
	var diff = newStamina - stamina
	spawnStaminaPenaltyIndicator(diff)
	stamina = newStamina

func spawnStaminaPenaltyIndicator(amount: int) -> void:
	var staminaPenaltyIndicator: ScoreIndicator = staminaPenaltyScene.instantiate()
	staminaPenaltyIndicator.amount = amount
	add_child(staminaPenaltyIndicator)
