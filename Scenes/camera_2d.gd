extends Camera2D

@onready var target : CharacterBody2D = get_tree().get_first_node_in_group("player")
@export var follow_speed: float = 5.0
@export var deadzone: Vector2 = Vector2(250, 120)

func _ready() -> void:
	make_current()

func _process(delta: float) -> void:
	if target == null:
		return

	var offset := target.global_position - global_position

	if abs(offset.x) > deadzone.x:
		global_position.x = lerp(
			global_position.x,
			target.global_position.x - sign(offset.x) * deadzone.x,
			follow_speed * delta
		)

	if abs(offset.y) > deadzone.y:
		global_position.y = lerp(
			global_position.y,
			target.global_position.y - sign(offset.y) * deadzone.y,
			follow_speed * delta
		)
