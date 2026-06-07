extends CharacterBody2D

var HP = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HP.text = str(HP)
	$AnimatedSprite2D.play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func damage(DMG):
	HP = HP - DMG
	$HP.text = str(HP)
	#print(str(HP))
	#print("OW")
	if HP <= 0 :
		die()
func die():
	queue_free()
	pass
