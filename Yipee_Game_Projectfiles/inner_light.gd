extends PointLight2D

@export var noise: NoiseTexture2D
var time_passed := 0.0
@onready var light: PointLight2D = $"."


func _process(delta: float) -> void:
	time_passed += delta
	var sampled_noise = noise.noise.get_noise_1d(time_passed)
	sampled_noise = abs(sampled_noise)
	if sampled_noise < 0.26:
		light.energy = 0.26
	else:
		light.energy = sampled_noise
