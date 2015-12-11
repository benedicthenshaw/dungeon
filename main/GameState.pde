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
    PFont arrowFont;
    float y;
    boolean showGuide = false;
    int time = 0;

    void load() {
        this.font = createFont("Quicksand-Light.ttf", 64);
        this.arrowFont = createFont("Arial", 64);
        textFont(this.font);
        
    }

    void update() {
        // show game guide on first key press,
        // switch to game on second key press
        if (keyPressed || mousePressed) {
            // force a wait of two seconds on guide screen
            if (showGuide && millis() > this.time + 2000) {
                ellipseMode(CORNER);
                rectMode(CORNER);
                state = game;
            }

            if (time == 0)
                this.time = millis();

            showGuide = true;
        }
    }

    void draw() {
        background(45, 45, 45);
        ellipseMode(CENTER);
        rectMode(CENTER);

        textFont(this.font);

        if (showGuide) {
            textSize(80);
            String t = "HOW TO PLAY";
            float w = textWidth(t);
            fill(242, 240, 236);
            text(t, (width - w)/2, 100);

            textFont(this.arrowFont);
            textSize(32);
            int fontOffset = 5;
            int offsetX = -300;

            fill(242, 240, 236);
            rect(offsetX + width/2, 200 - fontOffset, 45, 45, 10);
            t = "↑";
            w = textWidth(t);
            fill(45, 45, 45);
            text(t, offsetX + (width - w)/2, 200);

            fill(242, 240, 236);
            rect(offsetX + width/2, 250 - fontOffset, 45, 45, 10);
            t = "↓";
            w = textWidth(t);
            fill(45, 45, 45);
            text(t, offsetX + (width - w)/2, 250);

            fill(242, 240, 236);
            rect(offsetX + width/2 - 50, 250 - fontOffset, 45, 45, 10);
            t = "←";
            w = textWidth(t);
            fill(45, 45, 45);
            text(t, offsetX + (width - w)/2 - 50, 250);

            fill(242, 240, 236);
            rect(offsetX + width/2 + 50, 250 - fontOffset, 45, 45, 10);
            t = "→";
            w = textWidth(t);
            fill(45, 45, 45);
            text(t, offsetX + (width - w)/2 + 50, 250);

            textFont(this.font);
            textSize(38);
            t = "Use arrow keys to move.";
            w = textWidth(t);
            fill(242, 240, 236);
            text(t, -offsetX/2 + (width - w)/2, 250);

            offsetX = 300;

            fill(242, 240, 236);
            rect(offsetX + width/2, 400 - fontOffset, 200, 45, 10);
            t = "_";
            w = textWidth(t);
            fill(45, 45, 45);
            text(t, offsetX + (width - w)/2, 400);

            textFont(this.font);
            textSize(38);
            t = "Use space bar to pick up items.";
            w = textWidth(t);
            fill(242, 240, 236);
            text(t, -offsetX/2 + (width - w)/2, 400);

            fill(255 + 30*sin(millis()/100.0),
                 204 + 30*sin(millis()/100.0),
                 102 + 30*sin(millis()/100.0));
            ellipse(width/2 - 250, 550, 100, 100);

            fill(242, 119, 122);
            ellipse(width/2 - 350, 550, 100, 100);

            textFont(this.font);
            textSize(38);
            t = "Walk into enemies to attack them.";
            w = textWidth(t);
            fill(242, 240, 236);
            text(t, offsetX/2 + (width - w)/2, 560);

        } else {
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
}

class Game extends GameState {
    Level level = null;
    ArrayList<Particle> particles;
    int pCount=0;
    boolean shake = true;
    int shakeTime = 0;

    void load() {
        this.level = new Level(80, 45, width, height);
        this.level.generateLevel();
        particles = new ArrayList<Particle>();
    }

    void update() {
        // reveal map around player
        this.level.grid.makeAreaVisible(this.level.player.x,
                                        this.level.player.y,
                                        this.level.player.sightDistance);

        if (this.shake) {
            translate(random(-5, 5), random(-5, 5));
            // 50ms of screen shake
            if (millis() > this.shakeTime + 50) {
                this.shake = false;
                this.shakeTime = 0;
            }
        }

        // when the play dies let enemies continue to run around
        if (this.level.player.health <= 0) {
            if (frameCount % 30 == 0) {
                this.level.performTurn(Action.INTERACT);
            }
        }
    }

    void draw() {
        background(45, 45, 45);
        this.level.draw();

        // manages particles
        for (int i=game.pCount-1; i>0; i--) {
            if (particles.get(i).alpha<=0) {
                particles.remove(i);
                pCount--;
            } else {
                particles.get(i).draw();
            }
        }

        // draws currently equipped weapon icon
        if (this.level.player.weapon!=null) {
            if (this.level.player.weapon instanceof Sword) {
                imgRender(imgFrame, width-imgFrame.width*4, 0, 4);
                imgRender(imgSword, width-imgSword.width*4-8, 8, 4);
            }

            if (this.level.player.weapon instanceof Axe) {
                imgRender(imgFrame, width-imgFrame.width*4, 0, 4);
                imgRender(imgAxe, width-imgAxe.width*4-8, 8, 4);
            }
        }

        if (this.level.player.health <= 0) {
            fill(160, 159, 147, 50);
            rect(0, 0, width, height);
            fill(242, 119, 122, 30 + 20 * sin(millis()/200.0));
            rect(0, 0, width, height);

            textSize(120);
            String t = "YOU DIED!";
            float w = textWidth(t);
            fill(242, 119, 122);
            text(t, (width - w)/2, height/2);
            fill(242, 240, 236);
            text(t, (width - w)/2, height/2 + 2);

            textSize(38);
            t = "Press 'r' to retry.";
            w = textWidth(t);
            fill(242, 240, 236);
            text(t, (width - w)/2, height/2 + 100);
        }
    }
}