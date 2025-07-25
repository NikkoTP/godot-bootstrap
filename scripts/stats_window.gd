extends Control

var stats: Stats

const labelTitle = "Stats"
const labelStamina = "Stamina"
const labelTalk = "Talk"
const labelRomance = "Romance"
const labelParty = "Party"
const labelSports = "Sports"
const labelSubToDom = "Sub ~ Dom"
const labelCuteToDom = "Cute ~ Hot"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GridContainer/LabelTitle.text = labelTitle
	$GridContainer/LabelStamina.text = labelStamina
	$GridContainer/LabelTalk.text = labelTalk
	$GridContainer/LabelRomance.text = labelRomance
	$GridContainer/LabelParty.text = labelParty
	$GridContainer/LabelSports.text = labelSports
	$GridContainer/LabelSubToDom.text = labelSubToDom
	$GridContainer/LabelCuteToHot.text = labelCuteToDom
	
	$GridContainer/LabelStaminaValue.text = str(stats.stamina)
	$GridContainer/LabelTalkValue.text = str(stats.talk)
	$GridContainer/LabelRomanceValue.text = str(stats.romance)
	$GridContainer/LabelPartyValue.text = str(stats.party)
	$GridContainer/LabelSportsValue.text = str(stats.sports)
	$GridContainer/LabelSubToDomValue.text = str(stats.subToDom)
	$GridContainer/LabelCuteToHotValue.text = str(stats.cuteToHot)
