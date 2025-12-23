extends CharacterBody2D

const accel_grav = 5
var vector_grav = Vector2(0,1)
var gravity = accel_grav * vector_grav

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	move_and_slide()
