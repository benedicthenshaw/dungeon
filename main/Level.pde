// Level.pde : level generation and management

// layout/generation for levels
class Level {
    Grid grid;

    Level(int gridWidth, int gridHeight, int screenWidth, int screenHeight) {
        this.grid = new Grid(gridWidth, gridHeight, screenWidth, screenHeight);
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

    // places tile of a path
    void placePathStep(int x, int y) {
        // TODO: paths need walls
        this.grid.setTile(x, y, new StoneFloor());
    }

    // TODO: use Bresenham's line algorithm
    // draw straight path from one point to another (inclusive)
    void placePathLine(int startX, int startY, int endX, int endY) {
        if (startY == endY) {
            for (int i = startX; i <= endX; i++) {
                this.placePathStep(i, startY);
            }
        } else {
            for (int i = startY; i <= endY; i++) {
                this.placePathStep(startX, i);
            }
        }
    }

    // draw level grid
    void draw() {
        this.grid.draw();
    }
}
