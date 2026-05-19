extends Node2D

@export var cursor_texture: Texture2D

func _ready() -> void:
	Input.set_custom_mouse_cursor(cursor_texture)
