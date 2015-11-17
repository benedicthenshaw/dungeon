// Enemy.pde : superclass; all enemies

class Enemy extends Dynamic {
    int health;
    int damage;

    Enemy(int x, int y, int health, int damage) {
        super(x, y);
        this.health = health;
        this.damage = damage;
    }

    void takeTurn() {
        println("Enemy did something!");
    }

    void draw(int x, int y, int size) {
        fill(255, 50, 50);
        ellipse(x, y, size, size);
    }
}
