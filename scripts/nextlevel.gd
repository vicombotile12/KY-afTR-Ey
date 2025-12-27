extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var sceneroot = get_node("./")
	#sceneroot.change_room.connect(_change_room)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		pass#emit_signal()
