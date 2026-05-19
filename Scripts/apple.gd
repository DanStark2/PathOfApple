extends Area2D

@onready var player : CharacterBody2D = get_tree().get_first_node_in_group("player") # remember [0] is first in array

const dialog : Array[String] = ["Hello there.", "I am an apple.", "Please stop clicking me."]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():
	print(dialog)
	if player:
		player.move_target = self
	print(name, ": OH MY... I GOT CLICKED")


func _on_mouse_entered() -> void:
	$Sprite2D.texture.atlas = load("res://Assets/Sprites/apple2.png")


func _on_mouse_exited() -> void:
	$Sprite2D.texture.atlas = load("res://Assets/Sprites/apple.png")
