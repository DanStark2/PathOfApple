extends Area2D

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player")
@onready var sfx_player: AudioStreamPlayer = $SFXPlayer
@onready var bell_1: AudioStream = preload("res://Assets/SFX/Sounds/bell.mp3")

func _ready() -> void:
	$AnimatedSprite2D.play("default")


func _on_mouse_entered() -> void:
	$AnimatedSprite2D.play("glow")


func _on_mouse_exited() -> void:
	$AnimatedSprite2D.play("default")


func interact() -> void:
	if player == null:
		return

	player.interaction_id += 1
	var my_interaction_id = player.interaction_id

	player.move_target = self

	print(name, ": OH MY... I GOT CLICKED")

	await player.target_reached

	if my_interaction_id != player.interaction_id:
		return

	play_sfx()

func play_sfx():
		sfx_player.stream = bell_1
		sfx_player.play()
