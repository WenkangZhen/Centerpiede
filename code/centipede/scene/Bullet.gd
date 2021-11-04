extends Area2D
class_name Bullet

export var speed = 50.0

func _process(delta_time):
    if position.y < 50:
        Kill()
        pass
    position.y -= speed * delta_time

func Kill():
    queue_free()

