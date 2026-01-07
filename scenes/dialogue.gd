class_name DialogueBox
extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("Up")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not $PanelContainer/Label.text:
		get_parent().queue_free()
	elif $PanelContainer/Label.text.slice(0,3) == "New":
		$PanelContainer/Label.normal_font_size = 32

func down():
	$AnimationPlayer.play("Down")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Down":
		get_parent().queue_free()
