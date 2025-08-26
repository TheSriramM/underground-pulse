extends Node

var num_players = 8
var bus := "Master"

var available: Array = []  # The available players
var queue: Array = []      # The queue of sounds to play

func _ready():
	# Create the pool of AudioStreamPlayer nodes
	for i in range(num_players):
		var p := AudioStreamPlayer.new()
		add_child(p)
		p.bus = bus
		available.append(p)
		# Connect finished signal in Godot 4 style
		p.finished.connect(_on_stream_finished.bind(p))


func _on_stream_finished(stream: AudioStreamPlayer):
	# When finished playing a stream, make the player available again
	available.append(stream)


func play(sound_path: String):
	queue.append(sound_path)


func _process(delta: float) -> void:
	# Play a queued sound if any players are available
	if not queue.is_empty() and not available.is_empty():
		var player: AudioStreamPlayer = available.pop_front()
		var path: String = queue.pop_front()
		player.stream = load(path)
		player.play()
