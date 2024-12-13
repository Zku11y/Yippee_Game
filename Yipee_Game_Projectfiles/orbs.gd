extends Node2D


@export var player : CharacterBody2D

func _on_area_2d_body_entered(_body: Node2D) -> void:
	print("orb +1")
	player.orb_count += 1
	queue_free()
