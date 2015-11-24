// main.pde : entry point; pre-load; main loop
//this comment has been added to test github merging
Menu menu = new Menu();
Game game = new Game();
GameState state = null;

void setup() {
    // fullScreen();
    // DEBUG: windowed
    size(1280, 720);
    pixelDensity(displayDensity());
    noStroke();
    // noSmooth();
    ellipseMode(CORNER);

    menu.load();
    game.load();
    state = menu;
}

void draw() {
    state.update();
    state.draw();
}