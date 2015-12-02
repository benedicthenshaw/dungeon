// Player.pde : player state, input, actions

int INVENTORY_SIZE = 8;

class Player extends Dynamic {
    // distance between leftmost and rightmost visible tile
    int sightDistance;
    Item inventory[];


    Player(int x, int y, int health, int damage) {
        super(x, y, health, damage);
        // NOTE: what influences this stat?
        this.sightDistance = 11;
        this.inventory = new Item[INVENTORY_SIZE];
        this.weapon = null;
    }

    Player(int health, int damage) {
        super(health, damage);
        this.sightDistance = 11;
        this.inventory = new Item[INVENTORY_SIZE];
        this.weapon = null;
    }

    void move(int x, int y, Grid g) {
        super.move(x, y, g);
        g.makeAreaVisible(x, y, this.sightDistance);
    }

    void takeTurn(actions action, Level l) {
        if (this.health > 0) {
            this.input(action, l.grid);
        }
    }

    // take and act on player input for movement
    void input(actions action, Grid g) {
        switch (action) {
            case MOVE_UP: {
                this.step(0, -1, g);
                step1.trigger();
            } break;
            case MOVE_DOWN: {
                this.step(0, 1, g);
                step2.trigger();
            } break;
            case MOVE_LEFT: {
                this.step(-1, 0, g);
                step3.trigger();
            } break;
            case MOVE_RIGHT: {
                this.step(1, 0, g);
                step4.trigger();
            } break;
            case INTERACT: {
                g.data[this.x][this.y].onInteract(this);
            } break;
        }
    }

    void takeItem(Item i) {
        // TODO: dynamic inventory management
        this.inventory[0] = i;
    }
    
    void stepSound(Level l) {
        
        step2.trigger();
    }

    void draw(int x, int y, int size) {
        fill(255, 204, 102);
        arc(x, y, size, size, 0, TWO_PI * ((float)health/maxHealth), PIE);
        stroke(255, 204, 102);
        noFill();
        ellipse(x, y, size, size);
        noStroke();
    }
}