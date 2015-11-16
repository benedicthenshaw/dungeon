// Player.pde : player state, input, actions

int INVENTORY_SIZE = 8;

class Player extends Dynamic {
    int health;
    int damage;
    Item inventory[];

    Player(int health, int damage) {
        this.health = health;
        this.damage = damage;
        this.inventory = new Item[INVENTORY_SIZE];
    }

    void takeTurn(int action) {

        println("Player did something!");
    }

    // take and act on player input for movement
    void input() {

    }

    void takeItem(Item i) {
        // TODO: dynamic inventory management
        this.inventory[0] = i;
    }

    void draw(int x, int y, int size) {
        fill(50, 255, 50);
        ellipse(x, y, size, size);
    }
}
