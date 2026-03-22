extends Node

var Activated =  false
var level = -2
var once = false

var nextlevel
var tranplayer 
var tranrect

var ost_A = preload("res://resources/untitled.wav")
var ost_B = preload("res://resources/bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb.wav")
var ost_C = preload("res://resources/5-8 A Little Floccinaucinihilipilification.wav")
var ost_D

var keystate: Array[String] = []
var music_levels: Dictionary = {
	-2: null,
	-1: ost_A,
	0: ost_B,
	1: ost_B,
	2: ost_B,
	3: ost_B,
	4: ost_B,
	5: ost_C,
	6: ost_C,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tranrect = $Control/ColorRect
	tranplayer = $Control/ColorRect/AnimationPlayer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !once:
		once = !once
		connect_changer()

func _change_room() -> void:
	var next_levl = load("res://scenes/level_%s.tscn" % str(level + 1))
	print("res://scenes/level_%s.tscn" % str(level + 1))
	get_node("level%s" % str(level)).queue_free()
	print(level)
	print(next_levl)
	next_levl = next_levl.instantiate()
	add_child(next_levl)
	level += 1
	once = false
	
	tranrect.visible = true
	tranplayer.play("change")
	
	var current_music = music_levels[level]
	if (!$AudioStreamPlayer.playing or $AudioStreamPlayer.stream != music_levels[level]) and music_levels[level]:
		$AudioStreamPlayer.stream = current_music
		$AudioStreamPlayer.play()
	
	if keystate: for key in keystate:
		var player = get_node("level%s/Chesty" % level)
		player.keys_availability[key] = true


func _on_tranplayer_animation_finished(anim_name: StringName) -> void:
	tranrect.visible = false

func connect_changer():
	#var access_string = "level%s/objects" % str(level)
	#print(access_string)
	#nextlevel = get_node(access_string)
	#print(nextlevel)
	#nextlevel = nextlevel.get_child(0)
	#print(nextlevel)
	var nextlevel = get_tree().get_first_node_in_group("nextlevel")
	var play = get_tree().get_first_node_in_group("objects").get_node("Play")
	if nextlevel: 
		nextlevel.change_room.connect(_change_room)
	elif play:
		play.change_room.connect(_change_room)
	else: 
		print("no nextlevel")
		return

func kill_process():
	var player = get_node("level%s/Chesty" % level)
	player.velocity *= -1
	player.collision_layer = 2
	player.collision_mask = 2
	player.enabled = false
	
	var glitch_packed = preload("res://scenes/GLITCH.tscn")
	var glitch = glitch_packed.instantiate()
	player.add_child(glitch)
	
	$Timer.start()

func _on_timer_timeout() -> void:
	tranrect.visible = true
	tranplayer.play("change")
	var player = get_node("level%s/Chesty" % level)
	player.position = player.spawn_pos
	
	player.collision_layer = 1
	player.collision_mask = 1
	player.get_node("GPUParticles2D").queue_free()
	player.enabled = true

func new_key(newkey):
	var player = get_node("level%s/Chesty" % level)
	player.keys_availability[newkey] = true
	keystate.append(newkey)
