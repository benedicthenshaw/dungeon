// Player.pde : player state, input, Action

int INVENTORY_SIZE = 8;

class Player extends Dynamic {
    // distance between leftmost and rightmost visible tile
    int sightDistance;
    int feelDistance;

    // you can turn off sight and feels with Z and X respectively.
    boolean sightOn = true;
    boolean feelOn = true;

    Player(int x, int y, int health, int damage) {
        super(x, y, health, damage);
        this.sightDistance = 11;
        this.feelDistance = 22;
        this.weapon = null;
    }

    Player(int health, int damage) {
        super(health, damage);
        this.sightDistance = 11;
        this.feelDistance = 22;
        this.weapon = null;
    }

    // clone given player
    Player(Player p) {
        super();
        this.x = p.x;
        this.y = p.y;
        this.health = p.health;
        this.maxHealth = p.maxHealth;
        this.damage = p.damage;
        this.sightDistance = p.sightDistance;
        this.feelDistance = p.feelDistance;
        this.weapon = p.weapon;
    }

    void move(int x, int y, Grid g) {
        super.move(x, y, g);
        g.performFeel(x, y, this.feelDistance);
    }

    void takeTurn(Action action, Level l) {
        if (this.health > 0) {
            this.input(action, l.grid);
        }
    }

    int attack() {
        game.shake = true;
        game.shakeTime = millis();
        return super.attack();
    }

    // take and act on player input for movement
    void input(Action action, Grid g) {
        switch (action) {
            case MOVE_UP: {
                this.step(0, -1, g);
                randomStepSound();
            } break;

            case MOVE_DOWN: {
                this.step(0, 1, g);
                randomStepSound();
            } break;

            case MOVE_LEFT: {
                this.step(-1, 0, g);
                randomStepSound();
            } break;

            case MOVE_RIGHT: {
                this.step(1, 0, g);
                randomStepSound();
            } break;

            case INTERACT: {
                g.data[this.x][this.y].onInteract(this);
                g.performFeel(x, y, this.feelDistance);
            } break;
        }
    }

    void draw(int x, int y, int size) {
        // player colour pulses in brightness
        fill(255 + 30*sin(millis()/100.0),
             204 + 30*sin(millis()/100.0),
             102 + 30*sin(millis()/100.0));
        arc(x, y, size, size, 0, TWO_PI * ((float)health/maxHealth), PIE);
        stroke(255 + 30*sin(millis()/100.0),
               204 + 30*sin(millis()/100.0),
               102 + 30*sin(millis()/100.0));
        noFill();
        ellipse(x, y, size, size);
        noStroke();
    }
}
