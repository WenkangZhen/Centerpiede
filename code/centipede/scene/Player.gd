extends KinematicBody2D
class_name Player

const  BULLET_PS: PackedScene = preload("res://scene/Bullet.tscn")

var speed: float = 500.66
var direction: Vector2
var velocity: Vector2


func _process(delta_time):
    
    var x = Input.get_action_strength("Move_left")- Input.get_action_strength("Mover_right")
    
    var y = Input.get_action_strength("Move_up") - Input.get_action_strength("Mover_down")
    direction = Vector2( x, y)
    
    #var delta_position: Vector2 = Vector2.ZERO
    
    #if Input.is_action_just_pressed("Move_up"):
     #   delta_position = Vector2(0, -1)
      #  print("move up")
    #if Input.is_action_just_pressed("Mover_down"):
     #   delta_position = Vector2(0, 1)
      #  print("move Down")
    #if Input.is_action_just_pressed("Move_left"): 
     #   delta_position = Vector2(-1, 0)
      #  print("move left")
    #if Input.is_action_just_pressed("Mover_right"):
     #   delta_position = Vector2(1, 0)
      #  print("move right")    
        
    if Input.is_action_just_pressed("fire"):
        fire()
        
       
    Move(direction * speed * delta_time)
    
func Move (delta_position : Vector2):
      position += delta_position

func fire():
     var bullet: Bullet = BULLET_PS.instance()
     bullet.position = position
     get_parent().add_child(bullet)
     print ("fire")
