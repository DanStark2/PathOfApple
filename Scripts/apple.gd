extends Area2D

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player")
@onready var dialogManager: Node = get_tree().get_first_node_in_group("dialogManager")
@onready var wall_collision: CollisionShape2D = get_tree().get_first_node_in_group("AppleCollition").get_child(0)

var already_used := false

const dialog: Array[String] = [
	"Hello there.",
	"Yes. I am an apple.",
	"Not a door. Not a button. An apple.",
	"And yet you clicked me.",
	"Brave choice. Weird choice. Mostly annoying.",
	"You may not pass yet.",
	"I have important apple business to discuss.",
	"First: pears are suspicious.",
	"Second: gravity is rude.",
	"Third: you should really stop clicking random fruit.",
	"Do I look interactive?",
	"Okay, yes, technically I am unpassable.",
	"But that is beside the point.",
	"I have stood here for days.",
	"Thinking apple thoughts.",
	"Crunchy thoughts.",
	"Juicy thoughts.",
	"Thoughts no mortal should hear.",
	"You are still here.",
	"That means either you are patient...",
	"or the game will not let you leave.",
	"Honestly, relatable.",
	"Fine.",
	"You have survived my speech.",
	"I will let you pass.",
	"But remember this moment.",
	"An apple wasted your time.",
	"And you let it happen."
]


func _ready() -> void:
	pass


func interact() -> void:
	if already_used:
		return

	if player == null:
		return

	if dialogManager == null:
		print("No dialog manager found")
		return

	already_used = true

	player.interaction_id += 1
	var my_interaction_id = player.interaction_id

	player.move_target = self

	print(name, ": OH MY... I GOT CLICKED")

	await player.target_reached

	if my_interaction_id != player.interaction_id:
		return

	dialogManager.dialogQueue.append_array(dialog)
	dialogManager.nextText()

	await dialogManager.dialog_finished

	wall_collision.disabled = true
	print("Apple stopped blocking the path. Truly heroic fruit behavior.")


func _on_mouse_entered() -> void:
	$Sprite2D.texture.atlas = load("res://Assets/Sprites/apple2.png")


func _on_mouse_exited() -> void:
	$Sprite2D.texture.atlas = load("res://Assets/Sprites/apple.png")
