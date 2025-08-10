class_name Stats extends Node

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

func compareTo(stats: Stats) -> Stats:
	var compareResult = Stats.new()
	
	# stamina isn't relevant in compare-result
	compareResult.stamina = 100
	
	compareResult.talk  = self.talk - stats.talk
	compareResult.romance = self.romance - stats.romance
	compareResult.party = self.party - stats.party
	compareResult.sports = self.sports - stats.sports
	return null
