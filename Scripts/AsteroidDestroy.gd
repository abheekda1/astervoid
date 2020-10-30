extends RigidBody2D

func _ready():
	yield(get_tree().create_timer(5.0), "timeout")
	queue_free()
