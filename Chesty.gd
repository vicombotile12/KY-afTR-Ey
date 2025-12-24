extends CharacterBody2D

const accel_grav = 980
const v_gravs = [Vector2(0,1), Vector2(1,0), Vector2(0,-1), Vector2(-1,0)]
var v_grav = v_gravs[0]
var gravity = accel_grav * v_grav

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float)-> void:
	# first unlocked key
	if Input.is_action_just_pressed("rightkey"):
		match v_grav: #should hopefully scroll through gravities
			Vector2(0,1): v_grav = v_gravs[1]
			Vector2(1,0): v_grav = v_gravs[2]
			Vector2(0,-1): v_grav = v_gravs[3]
			Vector2(-1,0): v_grav = v_gravs[0]
	velocity += gravity * delta
	move_and_slide()
