extends Node

var Activated =  false
var level = 0
var once = false
var nextlevel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nextlevel = get_node("level%s/objects" % str(level))
	print(nextlevel)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !once:
		once = !once
		nextlevel = nextlevel.get_child(0)
		print(nextlevel)
		nextlevel.change_room.connect(_change_room)

func _change_room() -> void:
	print("Change the damn room already!")
