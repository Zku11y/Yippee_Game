extends PointLight2D
@onready var audio: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"
@export var noise : NoiseTexture2D
@onready var player: CharacterBody2D = $".."
@onready var timer: Timer = $Timer
@onready var animation: AnimationPlayer = $"../AnimationPlayer"

var time_left = 0
var time_passed = 0
var panic : float = 5
var original_time
var orbs = 0


func _ready() -> void:
	timer.start()
	original_time = timer.wait_time
	player.orb_count = 0
	orbs = 0

# use a 40sec timer and decrease the panic float by 0.125 every second
# if the orb variable in player increases, it gives the timer an additional 10 seconds
# but the max time is (to be balanced in testing) seconds no matter how many orbs you absorb
# if the player sprints then get a reduction of 100 miliseconds from the timer

func _process(_delta: float) -> void:
	time_left = timer.time_left
	if time_left == 0:
		timer.stop()
		self.energy = 0
	if time_left > 2 && player.sprint == true:
		timer.stop()
		timer.start(time_left - 0.1)
	time_passed = original_time - time_left
	panic = 3 - (time_passed * 0.125)
	#print("orb_count = ", orbs)
	var noise_shit = noise.noise.get_noise_1d(time_left)
	noise_shit = abs(noise_shit) + panic
	self.energy = noise_shit
	if self.energy > 2.5:
		self.energy = 2.5
	#print(time_left)
	if player.orb_count > orbs:
		timer.stop()
		if time_left + 10 <= 20:
			timer.start(time_left + 10)
		else:
			timer.start(20)
		orbs += 1
	print(self.energy, " time = ", time_left)
