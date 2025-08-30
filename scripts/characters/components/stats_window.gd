class_name StatsWindow extends Control

var stats: Stats

const labelTitle = "Stats"
const labelStamina = "Stamina"
const labelTalk = "Talk"
const labelRomance = "Romance"
const labelParty = "Party"
const labelSports = "Sports"
const labelSubToDom = "Sub ~ Dom"
const labelCuteToHot = "Cute ~ Hot"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PanelContainer/VBoxContainer/MarginContainer/LabelTitle.text = labelTitle
	$PanelContainer/VBoxContainer/MarginContainer2/GridContainer/LabelStamina.text = labelStamina
	$PanelContainer/VBoxContainer/MarginContainer2/GridContainer/LabelTalk.text = labelTalk
	$PanelContainer/VBoxContainer/MarginContainer2/GridContainer/LabelRomance.text = labelRomance
	$PanelContainer/VBoxContainer/MarginContainer2/GridContainer/LabelParty.text = labelParty
	$PanelContainer/VBoxContainer/MarginContainer2/GridContainer/LabelSports.text = labelSports
	$PanelContainer/VBoxContainer/MarginContainer2/GridContainer/LabelSubToDom.text = labelSubToDom
	$PanelContainer/VBoxContainer/MarginContainer2/GridContainer/LabelCuteToHot.text = labelCuteToHot
	
	$PanelContainer/VBoxContainer/MarginContainer2/GridContainer/LabelStaminaValue.text = str(stats.stamina)
	$PanelContainer/VBoxContainer/MarginContainer2/GridContainer/LabelTalkValue.text = str(stats.talk)
	$PanelContainer/VBoxContainer/MarginContainer2/GridContainer/LabelRomanceValue.text = str(stats.romance)
	$PanelContainer/VBoxContainer/MarginContainer2/GridContainer/LabelPartyValue.text = str(stats.party)
	$PanelContainer/VBoxContainer/MarginContainer2/GridContainer/LabelSportsValue.text = str(stats.sports)
	$PanelContainer/VBoxContainer/MarginContainer2/GridContainer/LabelSubToDomValue.text = str(stats.subToDom)
	$PanelContainer/VBoxContainer/MarginContainer2/GridContainer/LabelCuteToHotValue.text = str(stats.cuteToHot)
