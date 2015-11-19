// Enemy.pde : superclass; all enemies

class Enemy extends Dynamic {
    int health;
    int damage;

    Enemy(int x, int y, int health, int damage) {
        super(x, y);
        this.health = health;
        this.damage = damage;
    }

    void takeTurn(Grid g) {
        println("Enemy did something!");
        // DEBUG: random steps
        this.step(round(random(-1, 1)), round(random(-1, 1)), g);
    }

    void draw(int x, int y, int size) {
        fill(242, 119, 122);
        ellipse(x, y, size, size);
    }
}
