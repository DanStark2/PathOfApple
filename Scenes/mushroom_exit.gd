extends Area2D

@onready var arrow_cursor: Texture2D = preload("res://Assets/Sprites/stiik.png")
@onready var normal_cursor: Texture2D = preload("res://Assets/Sprites/arrow.png")
@onready var EndAnim: AnimationPlayer = get_tree().get_first_node_in_group("EndAnim")

func _on_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(normal_cursor)


func _on_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(arrow_cursor)


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("Clicked specifically on this Area2D")
			do_click_thing()


func do_click_thing() -> void:
	EndAnim.play("End")
