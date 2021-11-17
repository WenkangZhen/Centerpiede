extends Area2D
class_name Bullet

var player 
export var speed = 600

func _process(delta_time):
    if position.y < 50:
        Kill()
        pass
    position.y -= speed * delta_time

func Kill():
    player.Reload(1)
    queue_free()

