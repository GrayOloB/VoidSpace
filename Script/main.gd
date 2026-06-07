extends Node2D
@export var weap : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	newWeapon($Player, "Pistol")
	newWeapon($Player, "SMG")
	newWeapon($Player, "Laser Gun")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func newWeapon(owner, type):
	var placeholder = weap.instantiate()
	if owner.name == "Player" and type in GlobVars.currentweap:
		return
	if owner.name == "Player":
		GlobVars.currentweap.append(type)
		
	placeholder.weapOwner = owner
	placeholder.wpType = type
	owner.add_child(placeholder)
	pass
