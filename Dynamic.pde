// Dynamic.pde : superclass

// superclass for entities that take gameplay turns
class Dynamic extends Entity {
    // performs actions required each turn (overloaded in subclass)
    void takeTurn() {}
    
    // display dynamic entity (overloaded in subclass)
    void draw(int x, int y, int size) {}
}
