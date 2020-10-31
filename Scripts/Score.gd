extends Label

func _process(delta):
	var score = str(int(-get_parent().position.y/10))
	text = score
