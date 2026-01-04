extends Area2D

@export var text: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		var dialogue_scene = preload("res://scenes/dialogue.tscn")
		var dialogue = dialogue_scene.instantiate()
		var grandparent = get_node("../..")
		grandparent.add_child(dialogue)
		
		grandparent.get_node("DIALOGUE/PanelContainer/Label").text = text


func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		get_node("../../DIALOGUE").down()
