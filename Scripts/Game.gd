extends Node2D

var time = 0
var asteroidObj = load("res://Objects/Asteroid.tscn")
var coinObj = load("res://Objects/Coin.tscn")
var spawnTime
var deltaSpawnTime = 1
var asteroidSpawnRepeat = 0
var hiscore = 0
var numOfCoins = 0

func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return
	save_game.open("user://savegame.save", File.READ)
	while save_game.get_position() < save_game.get_len():
		var data = parse_json(save_game.get_line())
		var hiscore = data["hiscore"]
		var numOfCoins = data["numOfCoins"]

func _process(delta):
	spawnTime = 500/get_viewport_rect().size.x * deltaSpawnTime
	time += delta
	#print (numOfCoins)
	if time > spawnTime:
		asteroidSpawnRepeat += 1
		time = 0
		if spawnTime > 300/get_viewport_rect().size.x:
			deltaSpawnTime *= 0.995
		if has_node("Rocket"):
			var asteroid = asteroidObj.instance()
			add_child(asteroid)
			asteroid.position.x = rand_range($Rocket.position.x - get_viewport_rect().size.x/2, $Rocket.position.x + get_viewport_rect().size.x/2)
			asteroid.position.y = rand_range($Rocket.position.y - get_viewport_rect().size.y, $Rocket.position.y - 2 * get_viewport_rect().size.y)
			asteroid.rotation = rand_range(0, 6.28)
	if asteroidSpawnRepeat == 5:
		asteroidSpawnRepeat = 0
		if has_node("Rocket"):
			var coin = coinObj.instance()
			add_child(coin)
			coin.position.x = rand_range($Rocket.position.x - get_viewport_rect().size.x/2, $Rocket.position.x + get_viewport_rect().size.x/2)
			coin.position.y = rand_range($Rocket.position.y - get_viewport_rect().size.y, $Rocket.position.y - 2 * get_viewport_rect().size.y)

func save():
	var save_dict = {
		"hiscore" : hiscore,
		"numOfCoins" : numOfCoins
	}
	return save_dict

func save_data():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	var data = call("save")
	save_game.store_line(to_json(data))
