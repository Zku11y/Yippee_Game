extends Control
@onready var title: RichTextLabel = $RichTextLabel
@onready var button: Button = $Button
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var press: AudioStreamPlayer2D = $press
var button_pressed = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var strs = str("[shake rate=2 level=1]Yippee![/shake]")
	title.text = (strs)


func _on_button_pressed() -> void:
	if(button_pressed == true):
		return
	else:
		button_pressed = true
		transition()


func transition():
	print("button was pressed")
	press.play()
	animation.play("Camera_zoom")
	await animation.animation_finished
	animation.play("fade_out")
	await animation.animation_finished
	button.queue_free()
	get_tree().change_scene_to_file("res://main_game.tscn")
