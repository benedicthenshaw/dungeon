// main.pde : entry point; pre-load; main loop

Menu menu = new Menu();
Game game = new Game();
GameState state = null;

void setup() {
    // fullScreen();
    // DEBUG: windowed
    size(1280, 720);
    noStroke();
    ellipseMode(CORNER);

    menu.load();
    game.load();
    state = game;
}

void draw() {
    state.update();
    state.draw();
}
