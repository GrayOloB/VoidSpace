extends CanvasLayer
var isOpen = false
@export var slot : PackedScene
var hotbarList = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in 3 :
		createSlot()
	
	hotbarUpdate()
	pass # Replace with function ody.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ammoCounter()
	hotbarUpdate()
	if Input.is_action_just_pressed("inventory"):
		isOpen = !isOpen
		if isOpen:
			show()
		else:
			hide()
	pass

func createSlot():
	var joebiden
	joebiden = slot.instantiate()
	$hotbar.add_child(joebiden)
	hotbarList.append(joebiden)
	pass
func hotbarUpdate():
	if hotbarList.size() == 0:
		return
	
	for j in hotbarList.size():
		if j < GlobVars.currentweap.size():
			var wpon_name = GlobVars.currentweap[j]
			for weapon_data in GlobVars.weapons:
				if weapon_data["Name"] == wpon_name:
					hotbarList[j].texture = weapon_data["IMG"]
					break
		else:
			hotbarList[j].texture = null

func ammoCounter():
	if GlobVars.ammoC > -1 :
		$Label.text = str(GlobVars.ammoC) + "/" + str(GlobVars.magS)
	else :
		$Label.text = "Reloading"
