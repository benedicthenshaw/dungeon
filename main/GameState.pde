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
    float y;

    void load() {
        this.font = createFont("Quicksand-Light.ttf", 64);
        textFont(this.font);
        smooth();
    }

    void update() {
        // DEBUG: bypass menu
        if (keyPressed || mousePressed) {
            state = game;
        }
    }

    void draw() {
        ellipseMode(CENTER);

        background(45, 45, 45);

        float t = millis()/1000;
        y += (height + 100*sin(t) - y) * 0.05;

        fill(242, 119, 122);
        ellipse(width/2, height/2, 600 + 300 * sin(t), 600 + 300 * sin(t));
        fill(81, 81, 81, 100);
        ellipse(width/2, height/2, 500 + 1000 * sin(t*10), 500 + 1000 * sin(t*10));
        fill(81, 81, 81, 50);
        ellipse(width/2, height/2, 400 + 300 * sin(t*20), 400 + 300 * sin(t*20));

        textSize(120);
        String title = "DUNGEON CLEANER";
        float w = textWidth(title);
        fill(116, 115, 105);
        text(title, (width - w)/2, y/2);

        fill(242, 240, 236);
        text(title, (width - w)/2, y/2 + 2);

        textSize(32);
        String play = "press anything to play";
        w = textWidth(play);
        fill(116, 115, 105);
        text(play, (width - w)/2, 3*y/5);
        fill(242, 240, 236);
        text(play, (width - w)/2, 3*y/5 + 1);

        ellipseMode(CORNER);
    }
}

class Game extends GameState {
    Level level = null;

    void load() {
        this.level = new Level(80, 45, width, height);
        this.level.generateLevel();
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
