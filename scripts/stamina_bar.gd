class_name StaminaBar
extends ProgressBar

var stamina: int = 0


func _process(delta: float) -> void:
	self.value = stamina

func updateStamina(newStamina: int) -> void:
	stamina = newStamina
