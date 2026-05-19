extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var move_target: Node

@export var TARGET_DISTANCE = 70.0

@onready var dialogManager: Node = get_tree().get_first_node_in_group("dialogManager")
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# temp
var uno = true


func _physics_process(delta: float) -> void:
	if GlobalState.playerInputFrozen:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		play_anim("idle")
		move_and_slide()
		return

	if move_target != null:
		if uno:
			velocity.x = 0
			uno = false
		else:
			moveTo(move_target, delta)
	else:
		uno = true
		
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta
			
		if Input.is_action_just_pressed("ui_down"):
			pass

		var direction := Input.get_axis("ui_left", "ui_right")
		
		if direction:
			velocity.x = direction * SPEED
			
			if direction < 0:
				play_anim("walk_left")
			elif direction > 0:
				play_anim("walk_right")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			play_anim("idle")

	move_and_slide()


func moveTo(object: Node, delta: float):
	if global_position.distance_to(object.global_position) <= TARGET_DISTANCE:
		if GlobalState.playerInputFrozen == false:
			var dialog: Array[String] = object.dialog
			dialogManager.dialogQueue.append_array(object.dialog)
			print("my dumbo self, appended again and you have to clean up my mess")
		
		print("emptied move_target")
		print(object.dialog)
		
		dialogManager.nextText()
		move_target = null
		play_anim("idle")
		
	elif object:
		print(global_position.distance_to(object.position))
		print("started MoveTo")
		
		var old_x := position.x
		
		position.x = move_toward(
			position.x,
			object.position.x,
			SPEED * delta
		)
		
		if position.x < old_x:
			play_anim("walk_left")
		elif position.x > old_x:
			play_anim("walk_right")
		else:
			play_anim("idle")
	else:
		move_target = null
		uno = true
		play_anim("idle")


func play_anim(anim_name: String) -> void:
	if animated_sprite.animation != anim_name:
		animated_sprite.play(anim_name)
