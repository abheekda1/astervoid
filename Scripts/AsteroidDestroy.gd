extends RigidBody2D

func _ready():
	yield(get_tree().create_timer(20.0), "timeout")
	queue_free()
