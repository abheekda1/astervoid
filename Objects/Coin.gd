extends Area2D

func _on_Coin_body_entered(body):
	print (body.name)
	if body.name == "Rocket":
		var numOfCoins = get_parent().get("numOfCoins")
		numOfCoins += 1
		queue_free()
