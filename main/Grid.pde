// Grid.pde : tile-based grid

// manages and draws tile grid
class Grid {
    Tile data[][];
    int width;
    int height;
    int tileSize;
    int gridOffsetX;
    int gridOffsetY;

    // constructs new instance
    Grid(int gridWidth, int gridHeight, int screenWidth, int screenHeight) {
        this.data = new Tile[gridWidth][gridHeight];
        this.width = gridWidth;
        this.height = gridHeight;

        // scale grid to screen
        if (screenHeight <= screenWidth) {
            this.tileSize = screenHeight / gridHeight;
        } else {
            this.tileSize = screenWidth / gridWidth;
        }
        // center grid
        this.gridOffsetX = (screenWidth - (gridWidth * this.tileSize)) / 2;
        this.gridOffsetY = (screenHeight - (gridHeight * this.tileSize)) / 2;
    }

    // find grid scale using given resolution
    void rescale(int screenWidth, int screenHeight) {
        if (screenHeight <= screenWidth) {
            this.tileSize = screenHeight / this.height;
        } else {
            this.tileSize = screenWidth / this.width;
        }
        this.gridOffsetX = (screenWidth - (this.width * this.tileSize)) / 2;
        this.gridOffsetY = (screenHeight - (this.height * this.tileSize)) / 2;
    }

    // place item on tile at given location
    void placeItem(int x, int y, Item i) {
        if (tileInBounds(x, y)) {
            if (this.data[x][y] != null) {
                this.data[x][y].item = i;
            }
        }
    }

    // place dynamic entity on tile at given location
    void placeDynamic(int x, int y, Dynamic d) {
        if (tileInBounds(x, y)) {
            if (this.data[x][y] != null) {
                this.data[x][y].dyn = d;
            }
        }
    }

    // set tile / replace existing tile
    void setTile(int x, int y, Tile t) {
        if (tileInBounds(x, y)) {
            this.data[x][y] = t;
        }
    }

    // change tile type preserving contents
    void changeTile(int x, int y, Tile t) {
        if (tileInBounds(x, y)) {
            this.data[x][y] = new Tile(t);
        }
    }

    // draw a tile using scale
    void drawTile(int x, int y, Tile t) {
        if (tileInBounds(x, y)) {
            if (t != null) {
                t.draw(x * this.tileSize + gridOffsetX,
                       y * this.tileSize + gridOffsetY,
                       this.tileSize);
            }
            // DEBUG: draw grid lines
            // stroke(0, 0, 0, 50);
            // noFill();
            // rect(x * this.tileSize + gridOffsetX,
            //      y * this.tileSize + gridOffsetY,
            //      this.tileSize, this.tileSize);
            // noStroke();
        }
    }

    // display all tiles
    void draw() {
        for (int x = 0; x < this.width; x++) {
            for (int y = 0; y < this.height; y++) {
                this.drawTile(x, y, this.data[x][y]);
            }
        }
    }

    // DEBUG
    boolean tileInBounds(int x, int y) {
        if (x < width && y < height) {
            return true;
        } else {
            println("OUT OF GRID BOUNDS:", x, y);
            return false;
        }
    }
}
