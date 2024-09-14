extends Area2D

# Constants
const FILE_BEGIN = "res://Levels/level_"
const RANDOM_SOUND_COUNT = 4  # Number of random sounds

# Onready variables
@onready var pickup_sound: AudioStreamPlayer2D = $PickupSound
@onready var random_sounds: Array = [$RandomSound0, $RandomSound1, $RandomSound2, $RandomSound3]

var current_random_sound: AudioStreamPlayer2D = null

func _ready():
	# Initialize random number generator
	randomize()
	
	# Connect the finished signal of the pickup sound to a custom function
	pickup_sound.connect("finished", Callable(self, "_on_pickup_sound_finished"))

func _on_body_entered(body):
	# Play the pickup sound
	pickup_sound.play()

func _on_pickup_sound_finished():
	# Debug message to confirm the function is called
	print("Pickup sound finished, playing random sound.")

	# Pick a random sound from the list
	var random_index = randi() % RANDOM_SOUND_COUNT
	print("Random index:", random_index)  # Debug print to check the random index

	current_random_sound = random_sounds[random_index]
	if current_random_sound:
		# Connect the finished signal of the random sound to a custom function
		current_random_sound.connect("finished", Callable(self, "_on_random_sound_finished"))
		
		# Play the random sound
		current_random_sound.play()
	else:
		print("No sound node at index", random_index)

func _on_random_sound_finished():
	# Debug message to confirm the function is called
	print("Random sound finished, changing scene.")
	
	# Change to the next level
	var current_scene_file = get_tree().current_scene.scene_file_path
	var next_level_number = current_scene_file.to_int() + 1
	var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
	
	# Print the path to ensure it's correct
	print("Loading next level:", next_level_path)
	
	get_tree().change_scene_to_file(next_level_path)
