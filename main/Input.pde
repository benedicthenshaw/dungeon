// Input.pde : user input management

// player actions
enum actions {
    MOVE_UP,
    MOVE_DOWN,
    MOVE_LEFT,
    MOVE_RIGHT,
    INTERACT,
    SKIP
}

void keyPressed() {
    if (key == Settings.upKey || keyCode == Settings.upKey) {
        game.level.performTurn(actions.MOVE_UP);
    }
    if (key == Settings.downKey || keyCode == Settings.downKey) {
        game.level.performTurn(actions.MOVE_DOWN);
    }
    if (key == Settings.leftKey || keyCode == Settings.leftKey) {
        game.level.performTurn(actions.MOVE_LEFT);
    }
    if (key == Settings.rightKey || keyCode == Settings.rightKey) {
        game.level.performTurn(actions.MOVE_RIGHT);
    }
    if (key == Settings.interactKey || keyCode == Settings.interactKey) {
        game.level.performTurn(actions.INTERACT);
    }
    if (key == Settings.sightKeyUC || key == Settings.sightKeyLC) {
        game.level.player.sightOn=!game.level.player.sightOn;
    }
     if (key == Settings.feelKeyUC || key == Settings.feelKeyLC) {
        game.level.player.feelOn=!game.level.player.feelOn;
    }

    // DEBUG: re-generate level
    if (key == 'r' || key=='R') {
        game.level.generateLevel();
    }
}