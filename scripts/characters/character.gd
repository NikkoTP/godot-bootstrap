class_name Character
extends CharacterBody2D

@export var stats: Stats

@onready var statsWindowSpawner: StatsWindowSpawner = $StatsWindowSpawner
@onready var selectable: Selectable = $Selectable
