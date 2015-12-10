// Enemy.pde : superclass; all enemies

class Enemy extends Dynamic {
    // determines whether enemy is a "trap" enemy
    boolean burrower = false;
    // these make burrowers fade away when inactive while not really affecting others
    int maxVis = 10;
    int vis = maxVis;

    Enemy(int x, int y, int health, int damage) {
        super(x, y, health, damage);
        if (random(0, 10)>8) {
            this.burrower = true;
            this.damage += 4;
            this.vis = 0;
        }
    }

    Enemy(int health, int damage) {
        super(health, damage);
        if (random(0, 10) > 8) {
            this.burrower = true;
            this.damage += 4;
            this.vis = 0;
        }
    }

    void takeTurn(Level l) {
        if (this.health > 0) {
            int agroDistance = 15;
            int dx = this.x - l.player.x;
            int dy = this.y - l.player.y;
            if (abs(dx) < agroDistance &&
                abs(dy) < agroDistance &&
                l.player.health > 0) {
                if (floor(random(0, 2)) == 0) {
                    this.step((dx < 0) ? 1 : -1, 0, l.grid);
                } else {
                    this.step(0, (dy < 0) ? 1 : -1, l.grid);
                }
                vis = maxVis;
            } else {
                if (!burrower) {
                    switch (floor(random(0, 4))) {
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
                } else {
                    if (vis > 0) {
                        vis--;
                    } else {
                        if (this.health < this.maxHealth) {
                            this.health++;
                        }
                    }
                }
            }
        }
    }

    void draw(int x, int y, int size) {
        if (!burrower) {
            fill(242, 119, 122);
            stroke(242, 119, 122);
            arc(x, y, size, size, 0, TWO_PI * ((float)health/maxHealth), PIE);
            stroke(242, 119, 122, 255 * vis/maxVis);
            noFill();
            ellipse(x, y, size, size);
            noStroke();
        } else {
            fill(204, 153, 204, 255 * vis/maxVis);
            stroke(204, 153, 204, 255 * vis/maxVis);
            arc(x, y, size, size, 0, TWO_PI * ((float)health/maxHealth), PIE);
            stroke(204, 153, 204, 255 * vis/maxVis);
            noFill();
            ellipse(x, y, size, size);
            noStroke();
        }
    }
}
