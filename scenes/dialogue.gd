extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("Up")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func down():
	$AnimationPlayer.play("Down")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Down":
		queue_free()
