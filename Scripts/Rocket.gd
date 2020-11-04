extends KinematicBody2D

var angle = 0
var difficulty
var deltaDifficulty = 0
var explosionObj = load("res://Objects/Explosion.tscn")
var collided = false

func _process(delta):
	difficulty = 600 + deltaDifficulty
	difficulty += 0.0005
	var collision = move_and_collide(Vector2(difficulty * sin(angle) * delta, -difficulty * cos(angle) * delta))
	if collision:
		collided = true
		hide()
		var explosion = explosionObj.instance()
		get_parent().add_child(explosion)
		explosion.position = position
		get_node("Collider").queue_free()
		yield(get_tree().create_timer(1.5), "timeout")
		queue_free()
		get_tree().reload_current_scene()	
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		if (get_viewport().get_mouse_position().x <= get_viewport_rect().size.x/2):
			if angle > -1.5:
				rotate(-0.05)
				angle -= 0.05
		elif (get_viewport().get_mouse_position().x > get_viewport_rect().size.x/2):
			if angle < 1.5:
				rotate(0.05)
				angle += 0.05
	else:	
		rotate(-angle/25)
		angle -= angle/25
