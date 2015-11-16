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
        println("Loaded Menu");
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

        println("Loaded Game");
    }

    void update() {}

    void draw() {
        background(30, 30, 30);
        this.level.draw();

        // DEBUG: mouseover grid numbers (only works when no grid offset)
        fill(255, 150, 150);
        textSize(18);
        text(round(mouseX / this.level.grid.tileSize) + ", " +
             round(mouseY / this.level.grid.tileSize),
             5, 20);
    }
}
