extends CanvasLayer

signal dialog_finished

@onready var text: Label = $Label
@onready var sprite: Sprite2D = $Sprite2D

var dialogQueue: Array[String] = []
var menu_open: bool = false

func _ready() -> void:
	close()
	print(dialogQueue)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click") and menu_open:
		nextText()


func queueText() -> void:
	if dialogQueue.size() > 0:
		text.text = dialogQueue[0]


func nextText() -> void:
	open()
	
	if dialogQueue.size() > 0:
		text.text = dialogQueue[0]
		dialogQueue.remove_at(0)
	else:
		close()
		text.text = ""
		dialog_finished.emit()


func close() -> void:
	print("Dialog Menu Closed")
	menu_open = false
	GlobalState.playerInputFrozen = false
	sprite.visible = false
	text.visible = false


func open() -> void:
	print("Dialog Menu Opened")
	menu_open = true
	GlobalState.playerInputFrozen = true
	sprite.visible = true
	text.visible = true
