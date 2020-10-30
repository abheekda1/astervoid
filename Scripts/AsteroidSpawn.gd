extends Node2D

var time = 0
var asteroidObj = load("res://Objects/Asteroid.tscn")
var spawnTime
var deltaSpawnTime = 1

func _process(delta):
	spawnTime = 500/get_viewport_rect().size.x * deltaSpawnTime
	time += delta
	if time > spawnTime:
		time = 0
		deltaSpawnTime *= 0.995
		if has_node("Rocket"):
			var asteroid = asteroidObj.instance()
			add_child(asteroid)
			asteroid.position.x = rand_range($Rocket.position.x - get_viewport_rect().size.x/2, $Rocket.position.x + get_viewport_rect().size.x/2)
			asteroid.position.y = rand_range($Rocket.position.y - get_viewport_rect().size.y, $Rocket.position.y - 2 * get_viewport_rect().size.y)
			asteroid.rotation = rand_range(0, 6.28)
