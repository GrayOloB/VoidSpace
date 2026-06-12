extends Node2D
var dmg = 1
var reloadTime = 6
var magSize = 12
var radius = 20
var range = 20
var weapOwner = null
var wpType = "Pistol"
var pulledData = null

var is_reloading = false
var shootCooldown = 1
var shootTrue = true
@export var bullet : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(wpType)
	for i in GlobVars.weapons.size():
		if GlobVars.weapons[i]["Name"] == wpType:
			pulledData = GlobVars.weapons[i]
	if pulledData != null :
		dmg = pulledData["DMG"]
		$Sprite2D.texture = pulledData["IMG"]
		reloadTime = pulledData["RL"]
		$reloadTimer.wait_time = reloadTime
		magSize = pulledData["MAG"]
		shootCooldown = pulledData["WAIT"]
		
	
		
		
	print(str(magSize))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if weapOwner == null:
		return
	if weapOwner.name == "Player" and GlobVars.activeWeap != wpType:
		hide()
		return
	show()
	updateGlobal()
	if weapOwner.name == "Player":
		var mouse = get_global_mouse_position()
		position = radius * weapOwner.global_position.direction_to(mouse)
		look_at(get_global_mouse_position())
		if Input.is_action_pressed("r"):
			reload()
			return
		if Input.is_action_pressed("leftClick") :
			shoot()
		pass
	if weapOwner.name == "Enemy":
		var play = GlobVars.playerPos
		if weapOwner.global_position.distance_to(play) > range:
			return
		position = radius * weapOwner.global_position.direction_to(play)
		look_at(play)
		shoot()
	
	pass

func shoot():
	if shootTrue == false:
		return
	if magSize <= 0 or is_reloading == true:
		reload()
		return
	shootTrue = false
	var bul = bullet.instantiate()
	get_tree().root.add_child(bul)
	bul.DMG = dmg
	bul.global_position = $tip.global_position
	bul.global_rotation = global_rotation
	#print("SHOT" + str(magSize))
	magSize = magSize - 1
	updateGlobal()
	await get_tree().create_timer(shootCooldown).timeout
	shootTrue = true
	pass

func reload():
	if is_reloading : 
		return
	
	is_reloading = true
	
	$reloadTimer.start()
	await $reloadTimer.timeout
	magSize = pulledData["MAG"]
	is_reloading = false
	print(str(wpType))
	updateGlobal()
func updateGlobal():
	GlobVars.ammoC = magSize
	GlobVars.magS = pulledData["MAG"]
	if is_reloading :
		GlobVars.ammoC = -1
	pass
