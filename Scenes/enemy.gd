extends CharacterBody2D
@export var gun : PackedScene
var HP = 100
var range = 200
var speed = 50;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HP.text = str(HP)
	$AnimatedSprite2D.play("default")
	
	var weap = gun.instantiate()
	weap.weapOwner = $"."
	weap.wpType = "Pistol"
	weap.range = range
	add_child(weap)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player_pos = GlobVars.playerPos
	#print(player_pos)
	if global_position.distance_to(player_pos) < range:
		var dir = global_position.direction_to(player_pos)
		velocity = dir * speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()

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
