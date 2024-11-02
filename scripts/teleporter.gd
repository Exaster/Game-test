extends Area2D


const FILE_BEGIN = "res://Levels/level_"
const RANDOM_SOUND_COUNT = 4  
@onready var pickup_sound: AudioStreamPlayer2D = $PickupSound
@onready var random_sounds: Array = [$RandomSound0, $RandomSound1, $RandomSound2, $RandomSound3]

var current_random_sound: AudioStreamPlayer2D = null

func _ready():
	randomize()
	pickup_sound.connect("finished", Callable(self, "_on_pickup_sound_finished"))

func _on_body_entered(body):
	pickup_sound.play()

func _on_pickup_sound_finished():
	print("Pickup sound finished, playing random sound.")
	var random_index = randi() % RANDOM_SOUND_COUNT
	print("Random index:", random_index)
	current_random_sound = random_sounds[random_index]
	if current_random_sound:
		current_random_sound.connect("finished", Callable(self, "_on_random_sound_finished"))
		current_random_sound.play()
	else:
		print("No sound node at index", random_index)

func _on_random_sound_finished():
	print("Random sound finished, changing scene.")
	var current_scene_file = get_tree().current_scene.scene_file_path
	var next_level_number = current_scene_file.to_int() + 1
	var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
	print("Loading next level:", next_level_path)
	get_tree().change_scene_to_file(next_level_path)
