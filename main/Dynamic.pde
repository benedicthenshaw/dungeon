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
    void move(int x, int y, Grid g) {
        if (g.data[x][y] instanceof Floor) {
            g.data[this.x][this.y].onExit(this);
            g.data[x][y].onEnter(this);
            this.x = x;
            this.y = y;
        }
    }

    // movement relative to current position
    void step(int x, int y, Grid g) {
        this.move(this.x + x, this.y + y, g);
    }

    // display dynamic entity (overloaded in subclass)
    void draw(int x, int y, int size) {}
}
