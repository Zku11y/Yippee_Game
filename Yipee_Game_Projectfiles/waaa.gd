extends AudioStreamPlayer
@onready var timer: Timer = $"../PointLight2D/Timer"

var finished_play = true
var timer_start = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	self.play()
	await self.finished
	get_tree().change_scene_to_file("res://hud.tscn")
