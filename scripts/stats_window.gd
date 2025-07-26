class_name StatsWindow extends Control

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
	$PanelContainer/MarginContainer/GridContainer/LabelTitle.text = labelTitle
	$PanelContainer/MarginContainer/GridContainer/LabelStamina.text = labelStamina
	$PanelContainer/MarginContainer/GridContainer/LabelTalk.text = labelTalk
	$PanelContainer/MarginContainer/GridContainer/LabelRomance.text = labelRomance
	$PanelContainer/MarginContainer/GridContainer/LabelParty.text = labelParty
	$PanelContainer/MarginContainer/GridContainer/LabelSports.text = labelSports
	$PanelContainer/MarginContainer/GridContainer/LabelSubToDom.text = labelSubToDom
	$PanelContainer/MarginContainer/GridContainer/LabelCuteToHot.text = labelCuteToDom
	
	$PanelContainer/MarginContainer/GridContainer/LabelStaminaValue.text = str(stats.stamina)
	$PanelContainer/MarginContainer/GridContainer/LabelTalkValue.text = str(stats.talk)
	$PanelContainer/MarginContainer/GridContainer/LabelRomanceValue.text = str(stats.romance)
	$PanelContainer/MarginContainer/GridContainer/LabelPartyValue.text = str(stats.party)
	$PanelContainer/MarginContainer/GridContainer/LabelSportsValue.text = str(stats.sports)
	$PanelContainer/MarginContainer/GridContainer/LabelSubToDomValue.text = str(stats.subToDom)
	$PanelContainer/MarginContainer/GridContainer/LabelCuteToHotValue.text = str(stats.cuteToHot)
