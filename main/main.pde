// main.pde : entry point; pre-load; main loop

class Entity {}

Menu menu = new Menu();
Game game = new Game();
GameState state = null;

void setup() {
    fullScreen();
    noStroke();

    menu.load();
    game.load();
    state = game;
}

void draw() {
    state.update();
    state.draw();
}
