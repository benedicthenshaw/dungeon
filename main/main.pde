
// main.pde : entry point; pre-load; main loop

//Minim specific pre-loading, move this when you can
Minim minim;
AudioSample step1;
AudioSample step2;
AudioSample step3;
AudioSample step4;

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
    //minim specific loading move this somewhere else when you can
    minim = new Minim(this);
    step1 = minim.loadSample("step1.wav");
    step2 = minim.loadSample("step2.wav");
    step3 = minim.loadSample("step3.wav");
    step4 = minim.loadSample("step4.wav");
    step1.setGain(-24);
    step2.setGain(-24);
    step3.setGain(-24);
    step4.setGain(-24);
    
    menu.load();
    game.load();
    state = menu;
}

void draw() {
    state.update();
    state.draw();
    //println(Player.player.x);
}