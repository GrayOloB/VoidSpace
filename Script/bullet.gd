extends Area2D
var speed = 300
var DMG = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$sound.pitch_scale = randf_range(0.85, 1.15)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.x * speed * delta
	pass

func _on_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.




func _on_body_entered(body: Node2D) -> void:
	#print(str(body))
	if body.has_method("damage"):
		body.damage(DMG)
	queue_free()
