// Input.pde : user input management

enum Action {
    MOVE_UP,
    MOVE_DOWN,
    MOVE_LEFT,
    MOVE_RIGHT,
    INTERACT,
    SKIP
}

void keyPressed() {
    if (key == Settings.upKey || keyCode == Settings.upKey) {
        game.level.performTurn(Action.MOVE_UP);
    }

    if (key == Settings.downKey || keyCode == Settings.downKey) {
        game.level.performTurn(Action.MOVE_DOWN);
    }

    if (key == Settings.leftKey || keyCode == Settings.leftKey) {
        game.level.performTurn(Action.MOVE_LEFT);
    }

    if (key == Settings.rightKey || keyCode == Settings.rightKey) {
        game.level.performTurn(Action.MOVE_RIGHT);
    }

    if (key == Settings.interactKey || keyCode == Settings.interactKey) {
        game.level.performTurn(Action.INTERACT);
    }

    if (key == Settings.restartKey || keyCode == Settings.restartKey) {
        game.level.generateLevel();
        randomStepSound();
    }

    // if (key == Settings.sightKeyUC || key == Settings.sightKeyLC) {
    //     game.level.player.sightOn=!game.level.player.sightOn;
    // }

    //  if (key == Settings.feelKeyUC || key == Settings.feelKeyLC) {
    //     game.level.player.feelOn=!game.level.player.feelOn;
    // }
}
