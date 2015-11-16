// Dynamic.pde : superclass

// superclass for entities that take gameplay turns
class Dynamic extends Entity {
    // performs actions required each turn (overloaded in subclass)
    void takeTurn() {}

    // move entity to given point in grid
    void move(int x, int y, Grid grid) {
        grid.data[x][y].onEnter(this);
    }

    // display dynamic entity (overloaded in subclass)
    void draw(int x, int y, int size) {}
}
