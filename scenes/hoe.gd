class_name Hoe 
extends CharacterBody2D

# skill stats
@export_group("Skill Stats")
@export_range(0,100) var stamina: int = 100
@export_range(0,100) var talk: int = 0
@export_range(0,100) var romance: int = 0
@export_range(0,100) var party: int = 0
@export_range(0,100) var sports: int = 0

# nature stats
@export_group("Nature Stats")
@export_range(-1,1) var subToDom: float = 0
@export_range(-1,1) var cuteToHot: float = 0
