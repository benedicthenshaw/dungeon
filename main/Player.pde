// Player.pde : player state, input, actions

int INVENTORY_SIZE = 8;

class Player extends Dynamic {
    int x;
    int y;
    int health;
    int damage;
    Item inventory[];

    Player(int x, int y, int health, int damage) {
        this.x = x;
        this.y = y;
        this.health = health;
        this.damage = damage;
        this.inventory = new Item[INVENTORY_SIZE];
    }

    void takeTurn(Grid g) {

    }

    // move player to given point in grid
    void move(int x, int y, Grid grid) {
        grid.data[x][y].onEnter(this);
    }

    // take and act on player input for movement
    void input() {}
}
