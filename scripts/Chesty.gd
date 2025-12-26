extends CharacterBody2D

const accel_grav = 980
const v_gravs = [Vector2(0,1), Vector2(1,0), Vector2(0,-1), Vector2(-1,0)]
@export var v_grav = v_gravs[0]
var gravity = accel_grav * v_grav

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float)-> void:
	# first unlocked key
	if Input.is_action_just_pressed("rightkey") and (is_on_floor() or is_on_wall()): # can only change gravity under those conditions
		match v_grav: #should hopefully scroll through gravities
			Vector2.DOWN: v_grav = v_gravs[1]; up_direction = Vector2.LEFT
			Vector2.RIGHT: v_grav = v_gravs[2]; up_direction = Vector2.DOWN
			Vector2.UP: v_grav = v_gravs[3]; up_direction = Vector2.RIGHT
			Vector2.LEFT: v_grav = v_gravs[0]; up_direction = Vector2.UP
		gravity = v_grav * accel_grav
		$Sprite2D.rotation_degrees += -90
	velocity += gravity * delta
	move_and_slide()
	# got it to work :]
