class_name Sign
extends Area2D

@export var text: String
var dialogue_scene = preload("res://scenes/dialogue.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		_spawn_dialogue_box()


func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D and get_node("../CanvasLayer/DIALOGUE"):
		get_node("../CanvasLayer/DIALOGUE").down()

func _spawn_dialogue_box():
	var dialogue = dialogue_scene.instantiate()
		
	var grandparent = get_node("..")
	grandparent.add_child(dialogue)
	assert(grandparent.get_node("CanvasLayer"))
		
	grandparent.get_node("CanvasLayer/DIALOGUE/PanelContainer/Label").text = text
	grandparent.get_node("CanvasLayer/DIALOGUE").position.x = get_window().size.x / 2
