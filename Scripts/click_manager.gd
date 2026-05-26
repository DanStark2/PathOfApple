extends Node2D

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player")
@onready var AppleCollition: StaticBody2D = get_tree().get_first_node_in_group("AppleCollition")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and !GlobalState.playerInputFrozen:
		var object = get_object_at_pos(get_global_mouse_position())
		
		if object:
			print("Clicked on:", object.name)
			if object.has_method("interact"):
				object.interact()
		else:
			print("Clicked on nothing")

func get_object_at_pos(world_pos: Vector2) -> Node:
	var space_state := get_world_2d().direct_space_state
	
	var query := PhysicsPointQueryParameters2D.new()
	query.position = world_pos
	query.collide_with_areas = true
	query.collide_with_bodies = true
	query.exclude = [player.get_rid()]
	query.exclude = [AppleCollition.get_rid()]
	
	var results := space_state.intersect_point(query, 1)
	
	if results.size() > 0:
		return results[0]["collider"]
	return null
