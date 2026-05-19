extends Node2D

@onready var background_1: PackedScene = preload("res://Scenes/background.tscn")
@onready var background_2: PackedScene = preload("res://Scenes/background2.tscn")
@onready var background_1flip: PackedScene = preload("res://Scenes/backgroundflip.tscn")
@onready var background_2flip: PackedScene = preload("res://Scenes/background2.tscn")

@export var bgQueueLeft: Array[PackedScene]
@export var bgQueueRight: Array[PackedScene]
@export var loadDistance: int = 1152
@export var loadPosition: float = 1152 * 1.5
@export var loadYpos: int = 324

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player")


func _ready() -> void:
	pass
	

func _process(delta: float) -> void:
	if player.position.x <= loadPosition:
		loadLeft()


func loadLeft() -> void:
	if bgQueueLeft.size() == 0:
		return
	
	var bg_scene: PackedScene = bgQueueLeft[0]
	var bg: Node2D = bg_scene.instantiate()
	
	var bgPos: float = loadPosition - loadDistance
	
	bg.position = Vector2(bgPos, loadYpos)
	add_child(bg)
	
	loadPosition = bgPos
	bgQueueLeft.remove_at(0)
