extends Label

onready var gameNode = get_node("/root/Game")

func _process(delta):
	text = str(gameNode.numOfCoins)
