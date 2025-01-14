extends Node2D
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer

var timer : SceneTreeTimer
@export var player : CharacterBody2D


func _on_area_2d_body_entered(_body: Node2D) -> void:
	print("orb +1")
	if self.visible:
		self.visible = false
		audio.play()
		player.orb_count += 1
		await get_tree().create_timer(3).timeout
	#print(timer.time_left)
		self.visible = true
