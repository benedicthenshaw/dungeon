// Dynamic.pde : superclass

// superclass for entities that take gameplay turns
class Dynamic {
    int x;
    int y;

    Dynamic(int x, int y) {
        this.x = x;
        this.y = y;
    }

    // performs actions required each turn (overloaded in subclass)
    void takeTurn() {}

    // move entity to given point in grid
    void move(int x, int y, Grid grid) {
        if (grid.data[x][y] instanceof Floor) {
            grid.data[this.x][this.y].onExit(this);
            grid.data[x][y].onEnter(this);
            this.x = x;
            this.y = y;
        }
    }

    // display dynamic entity (overloaded in subclass)
    void draw(int x, int y, int size) {}
}
