// main.pde : entry point; pre-load; main loop

Menu menu = new Menu();
Game game = new Game();
GameState state = null;

void setup() {
    size(1280, 720);
    pixelDensity(displayDensity());
    noStroke();
    noSmooth();
    ellipseMode(CORNER);
    audioLoad();

    menu.load();
    game.load();
    imgLoad();

    state = menu;
}

void draw() {
    state.update();
    state.draw();
}
