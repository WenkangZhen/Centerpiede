extends KinematicBody2D
class_name Player

const  BULLET_PS: PackedScene = preload("res://scene/Bullet.tscn")

var speed: float = 500.66
var direction: Vector2
var velocity: Vector2
var ammo_count: int = 1


func _process(delta_time):
    
    var x: float = Input.get_action_strength("Mover_right") - Input.get_action_strength("Move_left")
    var y: float = Input.get_action_strength("Mover_down") - Input.get_action_strength("Move_up")
    direction = Vector2(x, y)
    if direction.length() > 1:
        direction = direction.normalized()
    
    
        
    if Input.is_action_just_pressed("fire"):
        fire()
        
       
    Move(direction * speed * delta_time)
    
func Move (delta_position : Vector2):
      position += delta_position

func fire():
    if ammo_count > 0:
     var bullet: Bullet = BULLET_PS.instance()
     bullet.player = self
     bullet.position = position
     get_parent().add_child(bullet)
     ammo_count -= 1
     print ("fire")
    
func Reload(count: int):
    ammo_count += count
    print("Ammo Count: " + str(ammo_count))    
    
    
