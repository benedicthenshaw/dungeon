#Level
Manages the tile layout and generation for a level, including all entities within the level.

##Fields
#####`ArrayList<`[`Enemy`](Enemy.md)`>` `enemies`
#####[`Grid`](Grid.md) `grid`
#####[`Player`](Player.md) `player`

##Methods
###createRoom
Creates a rectangular room. Parameters `x` and `y` refer to the top-left corner of the room. Remember that the walls take up one tile on every side, so the floor space will be `width`-2 x `height`-2.
```Java
void createRoom(int x, int y, int width, int height)
```
###draw
Draws all the Level contents to the screen.
```Java
void draw()
```
###performTurn
Performs any basic updates, then the player takes a turn, then each enemy takes a turn. Takes an enum of [Player](Player.md) actions (MOVE_LEFT, INTERACT, etc.).
```Java
void performTurn(actions action)
```
###placeEnemy
Places an [Enemy](Enemy.md) at the given [Grid](Grid.md) location; replaces any current Enemy.
```Java
void placeEnemy(int x, int y, Enemy d)
```
###placeItem
Places an [Tile](Tile.md) at the given [Grid](Grid.md) location; replaces any current [Item](Item.md).
```Java
void placeItem(int x, int y, Item i)
```
###placePathLine
Places a walled straight path from the start location to the end location. Walls are placed wherever no [Tile](Tile.md) exists, so you can run a path through the middle of a room without leaving stray walls inside that room.
```Java
void placePathLine(int startX, int startY, int endX, int endY)
```
###placePathStep
Places one [Tile](Tile.md) of floor with walls on either side; top+bottom if the path is moving horizontally, left+right if the path is moving vertically.
```Java
void placePathStep(int x, int y, boolean horizontal)
```
###placePlayer
Places player at given [Grid](Grid.md) location; replaces any current Player or Enemy.
```Java
void placePlayer(int x, int y, Player p)
```
