extends KinematicBody2D
class_name Player

const  BULLET_PS: PackedScene = preload("res://content/Bullet/Bullet.tscn")

var speed: float = 300
var direction: Vector2
var velocity: Vector2
var ammo_count: int = 4
var ammo_inventory: int = 1

func _process(_delta_time):
    
    var x: float = Input.get_action_strength("Mover_right") - Input.get_action_strength("Move_left")
    var y: float = Input.get_action_strength("Mover_down") - Input.get_action_strength("Move_up")
    direction = Vector2(x, y).normalized()

    # Input Fire
    if Input.is_action_pressed("fire"):
        fire()
    
    velocity = direction * speed
    move_and_slide(velocity)
    
    
func Move (delta_position : Vector2):
      position += delta_position

func Reload(count: int):
  if ammo_inventory < ammo_count:
     ammo_inventory += count
     print("Ammo Count: " + str(ammo_inventory))    

func fire():
    if ammo_inventory > 0:
      var bullet = BULLET_PS.instance()
      bullet.player = self
      bullet.position = position
      get_parent().add_child(bullet)
      print ("fire")
    
      ammo_inventory -= 1
    
func kill():
    queue_free()
       
    
    
