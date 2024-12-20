extends RichTextLabel
@onready var player: CharacterBody2D = $".."
var orbs


func _process(_delta: float) -> void:
	orbs = str(player.orb_count)
	self.text = (orbs)
