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
        this.font = createFont("Quicksand-Light.ttf", 128);
        textFont(this.font);
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
    Grid grid;
    
    void load() {
        this.grid = new Grid(160, 100, width, height);

        // DEBUG: random tiles
        for (int x = 0; x < this.grid.width; x++) {
            for (int y = 0; y < this.grid.height; y++) {
                this.grid.data[x][y] = new StoneFloor();
            }
        }
        for (int i = 0; i < 300; i++) {
            this.grid.data[(int)random(this.grid.width)][(int)random(this.grid.height)] = new StoneWall();
        }

        println("Loaded Game");
    }
    
    void update() {}
    
    void draw() {
        background(30, 30, 30);
        this.grid.draw();
    }
}
