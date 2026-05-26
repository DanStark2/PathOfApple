extends Node

@export var animation_player: AnimationPlayer

var correct_order := [0, 1, 2, 3]
var current_order: Array[int] = []

func mushroom_pressed(mushroom_id: int) -> void:
	current_order.append(mushroom_id)

	print("Current mushroom order: ", current_order)

	for i in range(current_order.size()):
		if current_order[i] != correct_order[i]:
			print("Wrong order. Resetting puzzle.")
			current_order.clear()
			return

	if current_order.size() == correct_order.size():
		print("Puzzle solved!")
		current_order.clear()

		if animation_player:
			animation_player.play("mushroom_end")
		else:
			print("No AnimationPlayer connected!")
