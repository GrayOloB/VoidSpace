extends CanvasLayer
var isOpen = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("inventory"):
		isOpen = !isOpen
		if isOpen:
			show()
		else:
			hide()
	pass
