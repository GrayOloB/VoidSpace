extends Node2D

@export var tilemap : TileMapLayer

var dungeonGrid = []
var dungeonHeight = 50
var dungeonWidth = 50

func _ready() -> void:
	createDungeon()

func _process(delta: float) -> void:
	pass
	
func generate_map():
	for y in dungeonHeight:
		dungeonGrid.append([])
		for x in dungeonWidth:
			dungeonGrid[y].append("EMPTY")
	var rooms : Array[Rect2] = []
	var maxAttempts = 100
	var tries = 0
	
	while rooms.size() < 10 and tries < maxAttempts :
		var w = randi_range(8,16)
		var h = randi_range(8,16)
		var x = randi_range(1, dungeonWidth-w-1)
		var y = randi_range(1, dungeonHeight-h-1)
		var room = Rect2(x,y,w,h)
		var overlap = false
		
		for other in rooms :
			if room.grow(1).intersects(other) :
				overlap = true
				break
		if !overlap :
			rooms.append(room)
			for iy in range(y, y+h):
				for ix in range(x, x+w):
					dungeonGrid[iy][ix] = "FLOOR"
			if rooms.size() > 1:
				var prev = Vector2i(rooms[rooms.size()-2].get_center())
				var curr = Vector2i(room.get_center())
				makeHalls(prev, curr,3)
			pass
		tries += 1
		
	pass

func tileTheMap():
	clear_map()
	for y in range(dungeonHeight):
		for x in range(dungeonWidth):
			var tile = dungeonGrid[y][x]
			if tile == "FLOOR":
				tilemap.set_cell(Vector2i(x,y), 0, Vector2i(0,0))
			if tile == "WALL":
				tilemap.set_cell(Vector2i(x,y), 0, Vector2i(0,1))
	pass

func clear_map():
	tilemap.clear()

func makeHalls(from : Vector2i, to : Vector2i, width ):
	var minWidth = -width/2
	var maxWidth = width/2
	if randf() < 0.5:
		for x in range(min(from.x, to.x),max(from.x, to.x) + 1):
			for offset in range(minWidth, maxWidth + 1):
				var y = from.y + offset
				if inBounds(x,y):
					dungeonGrid[y][x] = "FLOOR"
		for y in range(min(from.y, to.y),max(from.y, to.y) + 1):
			for offset in range(minWidth, maxWidth + 1):
				var x = to.x + offset
				if inBounds(x,y):
					dungeonGrid[y][x] = "FLOOR"
	else:
		for y in range(min(from.y, to.y),max(from.y, to.y) + 1):
			for offset in range(minWidth, maxWidth + 1):
				var x = from.x + offset
				if inBounds(x,y):
					dungeonGrid[y][x] = "FLOOR"
		for x in range(min(from.x, to.x),max(from.x, to.x) + 1):
			for offset in range(minWidth, maxWidth + 1):
				var y = to.y + offset
				if inBounds(x,y):
					dungeonGrid[y][x] = "FLOOR"
	

func inBounds(x,y) :
	return x>=0 and y >= 0 and x<dungeonWidth and y <dungeonHeight

func addWalls():
	for y in range(dungeonHeight):
		for x in range(dungeonWidth):
			if dungeonGrid[y][x] == "FLOOR":
				for dy in range(-1, 2):
					for dx in range(-1,2):
						var nx = x + dx
						var ny = y + dy
						if nx >= 0 and ny >= 0 and nx < dungeonWidth and ny < dungeonHeight:
							if dungeonGrid[ny][nx] == "EMPTY":
								dungeonGrid[ny][nx] = "WALL"

func createDungeon():
	generate_map()
	addWalls()
	tileTheMap()
