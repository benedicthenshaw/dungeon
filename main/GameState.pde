// GameState.pde : program states

// superclass of game states
class GameState {
    // called on game launch
    void load() {}

    // per frame update
    void update() {}

    // per frame draw
    void draw() {}
}

class Menu extends GameState {
    // PFont font;

    void load() {
        // this.font = createFont("Quicksand-Light.ttf", 128);
        // textFont(this.font);
    }

    void update() {
        // DEBUG: bypass menu
        if (keyPressed || mousePressed) {
            state = game;
        }
    }

    void draw() {
        background(200, 220, 220);
        fill(255);
        text("Play", 200, 200);
        text("Quit", 200, 600);
    }
}

class Game extends GameState {
    Level level = null;

    void load() {
        // DEBUG: basic test level
        this.level = new Level(80, 45, width, height);
        this.level.createRoom(10, 5, 10, 20);
        this.level.createRoom(50, 10, 20, 30);
        this.level.createRoom(25, 30, 10, 7);
        this.level.placePathLine(19, 16, 50, 16);
        this.level.placePathLine(33, 16, 33, 30);

        this.level.placePlayer(12, 7, new Player(12, 7, 10, 1));

        this.level.placeEnemy(17, 22, new Enemy(17, 22, 10, 1));
        this.level.placeEnemy(52, 12, new Enemy(52, 12, 10, 1));
        this.level.placeEnemy(58, 15, new Enemy(58, 15, 10, 1));
        this.level.placeEnemy(65, 18, new Enemy(65, 18, 10, 1));
        this.level.placeEnemy(60, 34, new Enemy(60, 34, 10, 1));

        this.level.placeItem(17, 7, new HealthPotion());
    }

    void update() {}

    void draw() {
        background(45, 45, 45);
        this.level.draw();

        // DEBUG: mouseover grid numbers (only works when no grid offset)
        fill(255, 204, 102);
        textSize(18);
        text(round(mouseX / this.level.grid.tileSize) + ", " +
             round(mouseY / this.level.grid.tileSize),
             5, 20);
    }
}
