extends Area2D

@onready var player : CharacterBody2D = get_tree().get_first_node_in_group("player")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	$AnimatedSprite2D.play("glow")


func _on_mouse_exited() -> void:
	$AnimatedSprite2D.play("default")
func interact():
	print("dialog")
	if player:
		player.move_target = self
	print(name, ": OH MY... I GOT CLICKED")
