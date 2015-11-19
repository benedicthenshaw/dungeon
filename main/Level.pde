// Level.pde : level generation and management

// layout/generation for levels
class Level {
    Grid grid;
    ArrayList<Enemy> enemies;
    Player player;

    Level(int gridWidth, int gridHeight, int screenWidth, int screenHeight) {
        this.grid = new Grid(gridWidth, gridHeight, screenWidth, screenHeight);
        this.enemies = new ArrayList<Enemy>();
        this.player = null;
    }

    // TODO: get tile type from parameters

    // place rectangular room with one tile thick walls
    // (floor space is width-2, height-2; walls take some space!)
    void createRoom(int x, int y, int width, int height) {
        // place floor
        for (int i = 1; i < width - 1; i++) {
            for (int j = 1; j < height - 1; j++) {
                this.grid.setTile(x + i, y + j, new StoneFloor());
            }
        }

        // place walls
        for (int i = 0; i < width; i++) {
            this.grid.setTile(i + x, y, new StoneWall());
            this.grid.setTile(i + x, y + height-1, new StoneWall());
        }
        for (int i = 1; i < height - 1; i++) {
            this.grid.setTile(x, i + y, new StoneWall());
            this.grid.setTile(x + width - 1, i + y, new StoneWall());
        }
    }

    // places one tile of a path
    void placePathStep(int x, int y, boolean horizontal) {
        // TODO: paths need walls
        this.grid.setTile(x, y, new StoneFloor());
        if (horizontal) {
            this.grid.setTile(x, y - 1, new StoneWall());
            this.grid.setTile(x, y + 1, new StoneWall());
        } else {
            this.grid.setTile(x - 1, y, new StoneWall());
            this.grid.setTile(x + 1, y, new StoneWall());
        }
    }

    // TODO: use Bresenham's line algorithm
    // draw straight path from one point to another (inclusive)
    void placePathLine(int startX, int startY, int endX, int endY) {
        if (startY == endY) {
            for (int i = startX; i <= endX; i++) {
                if (this.grid.data[i][startY] == null || this.grid.data[i][startY] instanceof Wall) {
                    this.placePathStep(i, startY, true);
                }
            }
        } else {
            for (int i = startY; i <= endY; i++) {
                if (this.grid.data[startX][i] == null || this.grid.data[startX][i] instanceof Wall) {
                    this.placePathStep(startX, i, false);
                }
            }
        }
    }

    void placeItem(int x, int y, Item i) {
        this.grid.placeItem(x, y, i);
    }

    void placeEnemy(int x, int y, Enemy d) {
        this.enemies.add(d);
        this.grid.placeDynamic(x, y, d);
    }

    void placePlayer(int x, int y, Player p) {
        this.player = p;
        this.grid.placeDynamic(x, y, p);
    }

    // carry out tasks that cause changes to the level
    // takes a player action; occurs on key press
    void performTurn(actions action) {
        // status update
        println("Something happened!");
        // enemy turns
        for (Enemy e : this.enemies) {
            e.takeTurn(this.grid);
        }
        // player turn
        this.player.takeTurn(action, this.grid);
    }


    // draw level grid
    void draw() {
        this.grid.draw();
    }
}
