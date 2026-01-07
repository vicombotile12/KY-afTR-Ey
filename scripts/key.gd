@abstract
class_name AreaKey
extends Area2D

var key: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.body_entered.connect(_on_body_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is Chesty:
		var root = get_tree().get_nodes_in_group("root")[0]
		root.keystate.append(key)
		root.new_key()
		
		queue_free()
