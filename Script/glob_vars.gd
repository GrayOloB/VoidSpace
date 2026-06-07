extends Node

var gameState = "Start"
var difficulty = 0
var weapons = [
	{ #MASTER LIST OF WEAPONS IN THE GAME
		"Name" : "Pistol", "DMG" : 1.5, "RL" : 1, "MAG" : 6, "WAIT" : 0.2,
		"IMG" : preload("res://Art/Weapons/centeredGun.png")
	},
	{ #MASTER LIST OF WEAPONS IN THE GAME
		"Name" : "SMG", "DMG" : 1, "RL" : 2, "MAG" : 12, "WAIT" : 0.05,
		"IMG" : preload("res://Art/Weapons/laser gun1-1.png (1).png")
	},
	{ #MASTER LIST OF WEAPONS IN THE GAME
		"Name" : "Laser Gun", "DMG" : 5, "RL" : 5, "MAG" : 5, "WAIT" : 1,
		"IMG" : preload("res://Art/Weapons/laser gun1-1.png.png")
	},
	]
var currentweap = []
	#CONTAINS PLAYER'S WEAPON INVENTORY

var activeWeap = "Pistol"
var ammoC = 6
var magS = 6
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
