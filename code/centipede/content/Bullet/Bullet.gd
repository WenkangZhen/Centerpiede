extends KinematicBody2D
class_name Bullet


export var speed = 600
var player 

func _process(delta_time):
    if position.y < -50:
        Kill()
       
    move_and_slide(Vector2.UP * speed)

func Kill():
    if is_instance_valid(player):
        player.Reload(1)
    queue_free()

