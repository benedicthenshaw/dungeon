// Dynamic.pde : superclass

// superclass for entities that take gameplay turns
class Dynamic {
    int x;
    int y;
    int health;
    int maxHealth;
    int damage;

    Dynamic(int x, int y, int health, int damage) {
        this.x = x;
        this.y = y;
        this.health = health;
        this.maxHealth = health;
        this.damage = damage;
    }

    // only to be used by Level.placeDynamic()
    Dynamic(int health, int damage) {
        this.x = -1;
        this.y = -1;
        this.health = health;
        this.maxHealth = health;
        this.damage = damage;
    }

    // performs actions required each turn (overloaded in subclass)
    void takeTurn() {}

    // move entity to given point in grid
    void move(int x, int y, Grid g) {
        if (g.data[x][y] instanceof Floor) {
            // if movement did occur
            if (g.data[x][y].onEnter(this)) {
                // NOTE: future bug if onExit gets more complicated
                g.data[this.x][this.y].onExit(this);
                this.x = x;
                this.y = y;
            }
        }
    }

    // movement relative to current position
    void step(int x, int y, Grid g) {
        this.move(this.x + x, this.y + y, g);
    }

    // display dynamic entity (overloaded in subclass)
    void draw(int x, int y, int size) {}
}
