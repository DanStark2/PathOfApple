extends CanvasLayer

@onready var text: Label = $Label
@onready var sprite: Sprite2D = $Sprite2D

var dialogQueue: Array[String] = []

var menu_open : bool = false

#temp
var AppleDialogTemp : Array[String] = ["Hello there.", "I am an apple.", "Please stop clicking me."]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	close()
	#dialogQueue.append("Hello there.")
	#dialogQueue.append("I am an apple.")
	#dialogQueue.append("Please stop clicking me.")
	print(dialogQueue)


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
		
func close():
	print("Dialog Menu Closed")
	menu_open = false
	GlobalState.playerInputFrozen = false
	sprite.visible = false
	text.visible = false
func open():
	print("Dialog Menu Opened")
	menu_open = true
	GlobalState.playerInputFrozen = true
	sprite.visible = true
	text.visible = true
