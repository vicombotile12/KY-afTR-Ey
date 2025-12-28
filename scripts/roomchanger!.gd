extends Node

var Activated =  false
var level = 0
var once = false
var nextlevel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !once:
		once = !once
		var access_string = "level%s/objects" % str(level)
		print(access_string)
		nextlevel = get_node(access_string)
		print(nextlevel)
		nextlevel = nextlevel.get_child(0)
		print(nextlevel)
		nextlevel.change_room.connect(_change_room)

func _change_room() -> void:
	var next_levl = load("res://scenes/level_%s.tscn" % str(level + 1))
	get_child(0).queue_free()
	next_levl = next_levl.instantiate()
	add_child(next_levl)
	level += 1
	once = false
