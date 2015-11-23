// Enemy.pde : superclass; all enemies

class Enemy extends Dynamic {
    int health;
    int damage;

    Enemy(int x, int y, int health, int damage) {
        super(x, y);
        this.health = health;
        this.damage = damage;
    }

    void takeTurn(Level l) {
        // DEBUG: simple movement towards player
        int agroDistance = 5;
        int dx = this.x - l.player.x; 
        int dy = this.y - l.player.y; 
        if (abs(dx) < agroDistance && abs(dy) < agroDistance) {
            if (round(random(0, 1)) == 0) {
                this.step((dx < 0) ? 1 : -1, 0, l.grid);
            } else {
                this.step(0, (dy < 0) ? 1 : -1, l.grid);
            }
        } else {
            switch(round(random(0, 3))) {
                case 0: {
                    this.step(0, -1, l.grid);
                } break;
                case 1: {
                    this.step(0, 1, l.grid);
                } break;
                case 2: {
                    this.step(-1, 0, l.grid);
                } break;
                case 3: {
                    this.step(1, 0, l.grid);
                } break;
            }
        }
    }

    void draw(int x, int y, int size) {
        fill(242, 119, 122);
        ellipse(x, y, size, size);
    }
}
