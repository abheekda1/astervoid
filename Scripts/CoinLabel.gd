extends Label

func _process(delta):
	var coins = str(get_parent().get_parent().get_parent().get("numOfCoins"))
	text = coins
