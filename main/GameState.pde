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
    PFont font;

    void load() {
        this.font = createFont("Quicksand-Light.ttf", 64);
        textFont(this.font);
    }

    void update() {
        // DEBUG: bypass menu
        if (keyPressed || mousePressed) {
            state = game;
        }
    }

    void draw() {
        ellipseMode(CENTER);

        background(81, 81, 81);
        // noFill();
        // stroke(242, 119, 122);
        fill(242, 119, 122);
        ellipse(width/2, height/2, height/2, height/2);
        // noStroke();

        textSize(120);
        String title = "DUNGEON CLEANER";
        float w = textWidth(title);
        fill(160, 159, 147);
        text(title, (width - w)/2, height/2);

        fill(242, 240, 236);
        text(title, (width - w)/2, height/2 + 3);

        textSize(42);
        String play = "do anything to play";
        w = textWidth(play);
        fill(242, 240, 236);
        text(play, (width - w)/2, 3*height/5);

        ellipseMode(CORNER);
    }
}

class Game extends GameState {
    Level level = null;

    void load() {
        this.level = new Level(80, 45, width, height);
        this.level.generateLevel();

        // DEBUG: basic test level
        // this.level.createRoom(10, 5, 10, 20);
        // this.level.createRoom(50, 10, 20, 30);
        // this.level.createRoom(15, 30, 30, 7);
        // this.level.createRoom(25, 5, 20, 8);

        // this.level.placePathLine(19, 20, 50, 20);
        // this.level.placePathLine(33, 20, 33, 30);
        // this.level.placePathLine(40, 12, 40, 20);

        // this.level.placePlayer(12, 7, new Player(20, 1));

        // this.level.placeEnemy(17, 22, new Enemy(10, 1));
        // this.level.placeEnemy(52, 12, new Enemy(10, 1));
        // this.level.placeEnemy(58, 15, new Enemy(10, 1));
        // this.level.placeEnemy(65, 18, new Enemy(10, 1));
        // this.level.placeEnemy(60, 34, new Enemy(10, 1));

        // this.level.placeItem(17, 7, new HealthPotion());
    }

    void update() {}

    void draw() {
        background(45, 45, 45);
        this.level.draw();

        // DEBUG: mouseover grid numbers (only works when no grid offset)
        // fill(255, 204, 102);
        // textSize(18);
        // text(round(mouseX / this.level.grid.tileSize) + ", " +
        //      round(mouseY / this.level.grid.tileSize),
        //      5, 20);
    }
}
