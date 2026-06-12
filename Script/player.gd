extends CharacterBody2D

var playerSpeed = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	GlobVars.playerPos = position
	var vel = Vector2.ZERO
	if Input.is_action_pressed("left"):
		vel.x -= 1
	if Input.is_action_pressed("right"):
		vel.x += 1
	if Input.is_action_pressed("up"):
		vel.y -= 1
	if Input.is_action_pressed("down"):
		vel.y += 1
	if Input.is_action_just_pressed("one"):
		GlobVars.activeWeap = GlobVars.currentweap[0]
	if Input.is_action_just_pressed("two"):
		GlobVars.activeWeap = GlobVars.currentweap[1]
	if Input.is_action_just_pressed("three"):
		GlobVars.activeWeap = GlobVars.currentweap[2]
	velocity = vel * playerSpeed
	move_and_slide()
	#print(position)
	pass
