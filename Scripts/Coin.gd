extends Area2D

onready var gameNode = get_node("/root/Game")

func _on_Coin_body_entered(body):
	if body.name == "Rocket":
		gameNode.numOfCoins += 1
		queue_free()
		
